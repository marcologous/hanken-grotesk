# source venv/bin/activate
set -e

mkdir -p ../fonts ../fonts/ttf ../fonts/ttf/static

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