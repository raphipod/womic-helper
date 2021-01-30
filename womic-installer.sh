#!/bin/bash
# https://github.com/raphipod/womic-installer

##################################
#                                #
# Copyright 2021 (C) Raphipod    #
#                                #
# The installer script for WoMic #
#                                #
##################################

# Please run this script as root!

# Download the WoMic-Client from the website

echo "\n\nNow downloading WoMic-Linux-client from website ..."

sleep 2

wget https://wolicheng.com/womic/softwares/micclient-x86_64.AppImage

echo "\n✓"

# Now, the file is in the working directory of this script.
# Make a new directory for WoMic-Client to reside in.

echo "\n\nCreating new directory: /usr/bin/MicClient ..."

sudo mkdir /usr/bin/MicClient

echo "\n✓"

sleep 2

# Give user rights to directory.

sudo chmod 777 /usr/bin/MicClient

# Move WoMic-AppImage to /usr/bin/MicClient.

echo "\n\nMoving WoMic to new directory"

sudo mv micclient-x86_64.AppImage /usr/bin/MicClient

echo "\n✓"

sleep 2

# Add WoMic-Module to PulseAudio config
# First, kill PulseAudio.

echo "\nKill PulseAudio in 5"

sleep 1 

echo "\nKill PulseAudio in 4"

sleep 1 

echo "\nKill PulseAudio in 3"

sleep 1 

echo "\nKill PulseAudio in 2"

sleep 1

echo "\nKill PulseAudio in 1"

sleep 1

pulseaudio -kill

echo "\n✓"

sleep 2

# Add WoMic-Module to PulseAudio config

echo "\n\nAdding WoMic-Module to PulseAudio config ..."

echo "load-module module-alsa-source device=hw:CARD=Loopback,DEV=1,SUBDEV=0" | sudo tee /etc/pulse/default.pa

echo "\n\n✓"

echo "\n\n\nNow proceed with the next script!"

exit 0