# source venv/bin/activate
set -e

mkdir -p ../fonts ../fonts/ttf ../fonts/ttf/static



# Generating VFS ==============================================================================================

function postprocess_vf {
    gftools fix-nonhinting $1 $1.fix
    mv $1.fix $1
    # gftools fix-vf-meta $1 $1.fix
    # mv $1.fix $1
    gftools fix-dsig -f $1
    gftools fix-unwanted-tables $1 -t MVAR
}

echo "GENERATING VFs"

VF_FILE=../fonts/ttf/HankenGrotesk\[wght]\.ttf
fontmake -g HankenGrotesk.glyphs -o variable --output-path $VF_FILE

VF_FILEit=../fonts/ttf/HankenGrotesk-Italic\[wght]\.ttf
fontmake -g HankenGroteskItalic.glyphs -o variable --output-path $VF_FILEit


echo "POST PROCESSING VFs"

postprocess_vf $VF_FILE
postprocess_vf $VF_FILEit

python3 hanken_stat_table.py $VF_FILE

rm ../fonts/ttf/*gasp.ttf


# Generating TTFS ==============================================================================================

echo "GENERATING TTFs"

fontmake -g HankenGrotesk.glyphs -i -o ttf --output-dir ../fonts/ttf/static
fontmake -g HankenGroteskItalic.glyphs -i -o ttf --output-dir ../fonts/ttf/static

echo "POST PROCESSING TTFs"

ttfs=$(ls ../fonts/ttf/static/*.ttf)
for ttf in $ttfs
do
	ttfautohint $ttf "$ttf.fix";
	mv "$ttf.fix" $ttf;
	
	gftools fix-dsig -f $ttf;
    
	gftools fix-hinting $ttf;
        mv "$ttf.fix" $ttf;
	
	#compressing for woff2
	#fonttools ttLib.woff2 compress $ttf
    
done

rm -rf master_ufo/ instance_ufo/

cp METADATA.pb output
cp DESCRIPTION.*.html output

export OPTIONS="--no-progress"
export OPTIONS="$OPTIONS --exclude-checkid /check/ftxvalidator" # We lack this on Travis.
export OPTIONS="$OPTIONS --exclude-checkid /check/varfont" # Delete this when making a variable font.
export OPTIONS="$OPTIONS --exclude-checkid /check/fontdata_namecheck" # We confirmed that "Hanken Grotesk" is
                                                                      # a good family name for the GFonts collection.
export OPTIONS="$OPTIONS --loglevel INFO --ghmarkdown HankenGrotesk-fontbakery.md"
fontbakery check-googlefonts $OPTIONS ttfs
