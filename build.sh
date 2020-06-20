rm output/ -rf

for src in sources/*.glyphs
do
  fontmake -g $src -o ttf -i --output-dir output/
done

for font in output/*.ttf
do
  gftools fix-nonhinting $font $font
  gftools fix-dsig $font --autofix
done

# Cleanup gftools mess:
rm output/*-backup-fonttools-prep-gasp.ttf

cp METADATA.pb output
# cp DESCRIPTION.*.html output

export OPTIONS="--no-progress"
export OPTIONS="$OPTIONS --exclude-checkid /check/ftxvalidator" # We lack this on Travis.
export OPTIONS="$OPTIONS --exclude-checkid /check/varfont" # Delete this when making a variable font.
export OPTIONS="$OPTIONS --exclude-checkid /check/fontdata_namecheck" # We confirmed that "Hanken Grotesk" is
                                                                      # a good family name for the GFonts collection.
export OPTIONS="$OPTIONS --loglevel INFO --ghmarkdown HankenGrotesk-fontbakery.md"
fontbakery check-googlefonts $OPTIONS output/*.ttf
