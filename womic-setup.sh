#!/bin/bash
# https://github.com/raphipod/womic-installer

##################################
#                                #
# Copyright 2021 (C) Raphipod    #
#                                #
# The setup script for WoMic     #
#                                #
##################################

# Please run this script as root!

pulseaudio -k

# Restart snd-aloop

echo -e "\n\n\nRestart snd-aloop ..."

sudo modprobe -r snd-aloop

sudo modprobe snd-aloop

echo -e "\n✓"

sleep 2

# Start PulseAudio

echo -e "\n\nStarting PulseAudio ..."

pulseaudio --start

echo -e "\n✓"

sleep 2

# Getting user variables

echo -e "\n\nWhich connection method to use? (Wifi, Bluetooth)"

read connection_method

sleep 2

echo -e "\nIP address of Phone?"

read ip_address

sleep 2

echo -e "\n\n✓ Saved settings"

# Connect client to mic server

echo -e "\n\nConnecting mic to Client ..."

while true; do nohup /usr/bin/MicClient/micclient-x86_64.AppImage -t $connection_method $ip_address > /dev/null 2>&1; sleep 1; done & 