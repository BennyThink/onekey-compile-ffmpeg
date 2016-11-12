#!/bin/bash
. functions.sh

echo -e '-----------------------------------------\n'
echo -e 'One key script to compile ffmpeg(non-free)\n'
echo -e '---------- written by Benny--------------\n'
echo -e 'Bug report to benny.think(at)gmail.com\n'
echo -e 'Press enter to compile...\n'
read p


Get_Dist_Name

if [ "${DISTRO}" = "unknow" ]; then
    Echo_Red "Unable to get Linux distribution name, or do NOT support the current distribution."
    exit 1
fi


#check root 
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script."
    exit 1
fi

#Dependencies
sudo apt update
sudo apt-get -y install autoconf automake build-essential libass-dev libfreetype6-dev \
  libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev \
  libxcb-xfixes0-dev pkg-config texinfo zlib1g-dev

mkdir ~/ffmpeg_sources

###########
#test for yasm
ver=`apt-cache show yasm|grep Version |sed "s/.* \([^ ]*\).*$/\1/"`
if [ $ver \> 1.2.0 -o $ver = 1.2.0 ]
then
echo $ver 'installing yasm from apt...'
sudo apt install -y yasm
else
echo 'cannot install yasm from apt, switch to compilation..'
Compile_yasm
fi


#test for libx264
ver=`apt-cache show libx264-dev|grep Version |sed "s/.* \([^ ]*\).*$/\1/"`
if [ $ver \> 2:0.148 -o $ver = 2:0.118 ]
then
echo $ver 'installing yasm from apt...'
sudo apt install -y libx264-dev
else
echo 'cannot install libx264 from apt, switch to compilation..'
Compile_x264
fi

#libx265, compilation is the only way
echo -e '\n'
Compile_x265

#test for aac
ver=`apt-cache show libfdk-aac-dev|grep Version |sed "s/.* \([^ ]*\).*$/\1/"`
if [ $ver != '' ]
then
echo $ver 'installing aac from apt...'
sudo apt install -y libfdk-aac-dev
else
echo 'cannot install aac from apt, switch to compilation..'
Compile_aac
fi

#test for lame
ver=`apt-cache show libmp3lame-dev|grep Version |sed "s/.* \([^ ]*\).*$/\1/"`
if [ $ver \> 3.98.3 -o $ver = 3.98.3 ]
then
echo $ver 'installing lame from apt...'
sudo apt install -y libmp3lame-dev
else
echo 'cannot install lame from apt, switch to compilation..'
Compile_lame
fi

#test for opus
ver=`apt-cache show libopus-dev|grep Version |sed "s/.* \([^ ]*\).*$/\1/"`
if [ $ver \> 1.1 -o $ver = 1.1 ]
then
echo $ver 'installing opus from apt...'
sudo apt install -y libopus-dev
else
echo 'cannot install opus from apt, switch to compilation..'
Compile_opus
fi

#VP8/VP9, no other choices
Compile_VP8

#compile ffmpeg

clear
Compile_ffmpeg
clear
source ~/.profile

echo -e 'Congratulations! Compilation has been finished!\n'
echo -e 'You may have to reopen a terminal to use ffmpeg.\n'
echo -e 'Besides, you could copy binaries from ~/bin to /bin,\n'
echo -e 'remove ~/bin, ~/ffmpeg_source and ~/ffmpeg_build\n'
echo -e 'Thanks for choosing this script, written by Benny\n'
echo -e 'Bug report to benny.think(at)gmail.com'














