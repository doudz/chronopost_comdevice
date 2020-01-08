#!/bin/bash
#comdevicelauncher

APPLICATION_NAME="Chronopost Com Device"
APPLICATION_JAR="chronopostcomdevice.jar"
APPLICATION_DIR=$(cd "$(dirname "$0")"; pwd)
WORK_DIR=~/.chronopost/comdevice/

#JVM args for java9
#VM_ARGS="-XX:+IgnoreUnrecognizedVMOptions --add-modules=java.se.ee --add-modules=java.xml.bind -Dfile.encoding=UTF-8"
VM_ARGS="-Dfile.encoding=UTF-8"

# Error message for NO JAVA dialog
ERROR_TITLE="Impossible de lancer $APPLICATION_NAME"

#JAVA_HOME=../jre
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
_java="$JAVA_HOME/bin/java"
cd "$APPLICATION_DIR"

echo "java= $_java"
echo "vmargs= $VM_ARGS" 

launcher_start()  {
	echo "start application..."
	$_java $VM_ARGS -jar "$APPLICATION_DIR/$APPLICATION_JAR"
	chmod -R 777 "$WORK_DIR/logs"
}

launcher_install() {
	echo "install..."

	mkdir -p "$WORK_DIR"
	cp -R "$APPLICATION_DIR/../Resources/Files/"* "$WORK_DIR"
 
	#SELECTED_BUTTON=$(osascript -e "set question to display dialog \"Bienvenue dans Chronopost Com Device\nWelcome to Chronopost Com Device\n\nVeuillez choisir la langue pour l'application\nPlease select application language\" with icon file \"$dir:comdevice.icns\" with title \"Installation de Chronopost Com Device\" buttons {\"Version Française\", \"English version\"} default button 1")

	touch "$WORK_DIR/lang_install.properties"
	#if [ "$SELECTED_BUTTON" == "button returned:English version" ]; then
	#	echo 'lang=en' > "$WORK_DIR/lang_install.properties"
	#else
	#	echo 'lang=fr' > "$WORK_DIR/lang_install.properties"
	#fi
	echo 'lang=fr' > "$WORK_DIR/lang_install.properties"

	launcher_start
}

# first launch ?
if [ -d "$WORK_DIR" ]; then
	launcher_start
else
	launcher_install
fi



