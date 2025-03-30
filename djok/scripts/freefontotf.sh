install -v -d -m755 /usr/share/fonts/freefont &&
install -v -m644 *.otf /usr/share/fonts/freefont &&
fc-cache -v /usr/share/fonts/freefont


mkdir -pv ~/.config/fontconfig &&
cat > ~/.config/fontconfig/fonts.conf << "EOF"
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>

  <match target="font" >
    <!-- autohint was the old automatic hinter when hinting was patent
    protected, so turn it off to ensure any hinting information in the font
    itself is used, this is the default -->
    <edit mode="assign" name="autohint">  <bool>false</bool></edit>

    <!-- hinting is enabled by default -->
    <edit mode="assign" name="hinting">   <bool>true</bool></edit>

    <!-- for the lcdfilter see https://www.spasche.net/files/lcdfiltering/ -->
    <edit mode="assign" name="lcdfilter"> <const>lcddefault</const></edit>

    <!-- options for hintstyle:
    hintfull: is supposed to give a crisp font that aligns well to the
    character-cell grid but at the cost of its proper shape. However, anything
    using Pango >= 1.44 will not support full hinting, Pango now uses harfbuzz
    for hinting. Apps which use Skia (e.g. Chromium, Firefox) should not be
    affected by this. 

    hintmedium: is reported to be broken.
    hintslight is the default: - supposed to be more fuzzy but retains shape.

    hintnone: seems to turn hinting off.
    The variations are marginal and results vary with different fonts -->
    <edit mode="assign" name="hintstyle"> <const>hintslight</const></edit>

    <!-- antialiasing is on by default and really helps for faint characters
    and also for 'xft:' fonts used in rxvt-unicode -->
    <edit mode="assign" name="antialias"> <bool>true</bool></edit>

    <!-- subpixels are usually rgb, see
    http://www.lagom.nl/lcd-test/subpixel.php -->
    <edit mode="assign" name="rgba">      <const>rgb</const></edit>

    <!-- thanks to the Arch wiki for the lcd and subpixel links -->
  </match>

</fontconfig>
EOF