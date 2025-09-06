#!/bin/bash

# Parameters
MODE="everything-profile"
ANIMATION="0.75"

handle_error() {
	echo -e "\e[31m[!] Something went wrong, quitting!\e[0m"
	exit 1
}

trap handle_error ERR

msg() {
	echo -e "\e[32m[*] $1\e[0m"
}

install() {
    msg "Compiling apps as $MODE mode"
    adb shell cmd package compile -a -f -m "$MODE"

    msg "Running the dexopt job to optimize dex"
    adb shell cmd package bg-dexopt-job

    msg "Setting up animations as $ANIMATION for smoothness"
    adb shell settings put global window_animation_scale $ANIMATION
    adb shell settings put global transition_animation_scale $ANIMATION
    adb shell settings put global animator_duration_scale $ANIMATION
    msg "Done!"
    exit 0
}

uninstall() {
	msg "Reverting the tweaks"
	adb shell pm compile -a -f -r install
	adb shell pm bg-dexopt-job
	adb shell settings put global window_animation_scale 1.0
	adb shell settings put global transition_animation_scale 1.0
	adb shell settings put global animator_duration_scale 1.0
	msg "Done!"
	exit 0
}

if [[ "$1" == "install" ]]; then
    install
elif [[ "$1" == "uninstall" ]]; then
	uninstall
else
	echo "Usage: $0 install/uninstall"
fi
exit 0
