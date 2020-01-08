#!/bin/bash

mkdir -p deb/opt
rsync -a --delete chronopostcomdevice deb/opt/
chmod +x deb/opt/chronopostcomdevice/Linux/launcher.sh
fakeroot dpkg -b deb
