#!/bin/bash

mkdir -p deb/opt
rsync -a --delete chronopostcomdevice deb/opt/
chmod +x deb/opt/chronopostcomdevice/Linux/launcher.sh
chmod -R 0777 deb/opt/chronopostcomdevice/Linux/logs
mkdir -p deb/usr/share/icons/hicolor/16x16/apps
mkdir -p deb/usr/share/icons/hicolor/24x24/apps
mkdir -p deb/usr/share/icons/hicolor/32x32/apps
mkdir -p deb/usr/share/icons/hicolor/48x48/apps
mkdir -p deb/usr/share/icons/hicolor/64x64/apps
mkdir -p deb/usr/share/icons/hicolor/128x128/apps
mkdir -p deb/usr/share/icons/hicolor/256x256/apps
convert chronopostcomdevice/Linux/comdevice.png -resize 16x16 deb/usr/share/icons/hicolor/16x16/apps/comdevice.png
convert chronopostcomdevice/Linux/comdevice.png -resize 24x24 deb/usr/share/icons/hicolor/24x24/apps/comdevice.png
convert chronopostcomdevice/Linux/comdevice.png -resize 32x32 deb/usr/share/icons/hicolor/32x32/apps/comdevice.png
convert chronopostcomdevice/Linux/comdevice.png -resize 48x48 deb/usr/share/icons/hicolor/48x48/apps/comdevice.png
convert chronopostcomdevice/Linux/comdevice.png -resize 64x64 deb/usr/share/icons/hicolor/64x64/apps/comdevice.png
convert chronopostcomdevice/Linux/comdevice.png -resize 128x128 deb/usr/share/icons/hicolor/128x128/apps/comdevice.png
convert chronopostcomdevice/Linux/comdevice.png -resize 256x256 deb/usr/share/icons/hicolor/256x256/apps/comdevice.png
fakeroot dpkg-deb --build deb
dpkg-name deb.deb
#clear
rm -R deb/opt
rm -R deb/usr/share/icons
