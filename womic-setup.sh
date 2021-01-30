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

echo "\n\n\nRestart snd-aloop ..."

sudo modprobe -r snd-aloop

sudo modprobe snd-aloop

echo "\n✓"

sleep 2

# Start PulseAudio

echo "\n\nStarting PulseAudio ..."

pulseaudio --start

echo "\n✓"

sleep 2

# Getting user variables

echo "\n\nWhich connection method to use? (Wifi, Bluetooth)"

read connection_method

sleep 2

echo "\nIP address of Phone?"

read ip_address

sleep 2

echo "\n\n✓ Saved settings"

# Connect client to mic server

echo "\n\nConnecting mic to Client ..."

while true; do nohup MicClient -t $connection_method $ip_address > /dev/null 2>&1; sleep 1; done & 