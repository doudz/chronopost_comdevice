#!/bin/bash

mkdir -p deb/opt
rsync -a --delete chronopostcomdevice deb/opt/
chmod +x deb/opt/chronopostcomdevice/Linux/launcher.sh
chmod -R 0777 deb/opt/chronopostcomdevice/Linux/logs
fakeroot dpkg -b deb
