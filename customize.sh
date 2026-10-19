#!/usr/bin/env bash
# Run inside Cubic's chroot terminal while building the ISO.
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y --no-install-recommends flatpak gnome-software gnome-software-plugin-flatpak dconf-cli

os_release_file=/etc/os-release
if [[ -L /etc/os-release && -f /usr/lib/os-release ]]; then
  os_release_file=/usr/lib/os-release
fi
sed -i 's/^NAME=.*/NAME="Study OS"/; s/^PRETTY_NAME=.*/PRETTY_NAME="Study OS 26.04 LTS"/' "$os_release_file"

if [[ ! -f /usr/share/backgrounds/study-os-wallpaper.svg ]]; then
  echo "Copy study-os-wallpaper.svg to /usr/share/backgrounds/ in Cubic before running this script." >&2
  exit 1
fi
install -d -m 0755 /etc/dconf/db/local.d
if [[ ! -f /etc/dconf/profile/user ]]; then
  install -d -m 0755 /etc/dconf/profile
  cat > /etc/dconf/profile/user <<'EOF_PROFILE'
user-db:user
system-db:local
EOF_PROFILE
fi
cat > /etc/dconf/db/local.d/00-custom-distro <<'EOF_DCONF'
[org/gnome/desktop/background]
picture-uri='file:///usr/share/backgrounds/study-os-wallpaper.svg'
picture-uri-dark='file:///usr/share/backgrounds/study-os-wallpaper.svg'
EOF_DCONF
dconf update

flatpak remote-add --system --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --system --noninteractive flathub \
  org.libreoffice.LibreOffice \
  org.zotero.Zotero \
  net.ankiweb.Anki \
  com.github.johnfactotum.Foliate \
  org.mozilla.firefox \
  com.opera.opera-gx
apt-get clean
rm -rf /var/lib/apt/lists/*
# Additional purpose-specific applications installed into the customized image.
flatpak install --system --noninteractive flathub com.vscodium.codium org.gnome.Builder org.gnome.Maps

# Ten additional purpose-specific applications
flatpak install --system --noninteractive flathub com.calibre_ebook.calibre org.thonny.Thonny org.godotengine.Godot org.qgis.qgis org.gnome.Papers org.gnome.Calculator org.gnome.Calendar org.gnome.clocks org.gnome.Weather org.gnome.SimpleScan

# Fifteen additional purpose-specific applications
flatpak install --system --noninteractive flathub org.jabref.jabref com.github.xournalpp.xournalpp org.mozilla.Thunderbird org.gnome.Evolution org.gnome.gitg org.geogebra.GeoGebra org.stellarium.Stellarium org.kde.digikam org.gnome.Shotwell io.dbeaver.DBeaverCommunity org.musescore.MuseScore org.librecad.librecad org.gnome.TextEditor org.gnome.Contacts org.gnome.Boxes

# Fifteen further purpose-specific applications
flatpak install --system --noninteractive flathub org.kde.okular org.kde.kate org.kde.marknote org.kde.klevernotes com.github.flxzt.rnote org.kde.kclock org.kde.kbibtex org.kde.kontact org.kde.kalarm org.kde.kmymoney org.kde.kcalc org.kde.ark org.kde.dolphin io.github.flattool.Warehouse org.gnome.meld

# Include Blender in the customized image.
flatpak install --system --noninteractive flathub org.blender.Blender
