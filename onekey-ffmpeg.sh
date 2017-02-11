#!/bin/bash
. functions.sh

Get_Dist_Name

#check distribution
if [ "${DISTRO}" = "unknow" ]; then
    Echo "Unable to get Linux distribution name, or do NOT support the current distribution."
    exit 1
fi

#check root 
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script."
    exit 1
fi

echo -e "-----------------------------------------\n"
echo -e "\033[47;30m One key script to build ffmpeg(non-free)\033[0m"
echo -e "---------- written by Benny--------------\n"
echo -e "--------Hello there, $DISTRO user--------"
echo -e "Please enter your choice:"
echo -e "1. Build ffmpeg(non-free)"
echo -e "2. Revert all changes and uninstall."
read p

#1 - build; 2 - revert
if [ $p -eq 1 ]; then
	echo "Press any key to build ffmpeg..."
	read
elif [ $p -eq 2 ]; then
	echo "Presss any key to revert changes..."	
	read
	revert_changes $PM	
	exit 0
else
	echo "Wrong input, exit now..."
	exit 0
fi


#create dir
mkdir ~/ffmpeg_sources

#Dependencies
if [ "$PM" = "yum" ]; then
	sudo $PM update
	sudo $PM install -y autoconf automake bzip2 cmake freetype-devel gcc gcc-c++ git libtool make mercurial nasm pkgconfig zlib-devel
	Compile_on_CentOS
	exit 0
elif [ "$PM" = "apt" ]; then
	sudo $PM update
	sudo $PM install -y autoconf automake build-essential libass-dev libfreetype6-dev \
  		libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev \
  		libxcb-xfixes0-dev pkg-config texinfo zlib1g-dev
fi


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

echo -e 'Congratulations! Compilation succeed!\n'
echo -e 'You may have to reopen a terminal to use ffmpeg.\n'
echo -e 'Thanks for choosing this script, written by Benny\n'
echo -e 'Bug report to benny.think(at)gmail.com'














