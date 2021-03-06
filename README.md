# onekey-compile-ffmpeg
Onekey shell script to compile ffmpeg non-free on Debian/Ubuntu/Mint/CentOS/RHEL/Fedora.

## Pre-build release ##
If you are too lazy to build ffmpeg non-free  and have faith in me, you could just simply download my binaries by cliking [here](http://bennydownload.file.alimmdn.com/ffmpeg-N-83470-gba632ef.tar.bz2?t=1486805078669) or use official static builds: [Linux](https://www.johnvansickle.com/ffmpeg/), [Windows](https://ffmpeg.zeranoe.com/builds/), [MacOS](https://evermeet.cx/ffmpeg/).
Ffmpeg version is ffmpeg-N-83470-gba632ef, outdated I guess.

## Description ##
As you may see from the title, this is a onekey onekey shell script to compile `ffmpeg non-free` on Debian/Ubuntu/Mint/CentOS/RHEL/Fedora.

With this you could compile `ffmpeg` along with `x264, x265, aac, lame, VP8/9, opus` which is apparently non-free!

## Distribution ##
Due to my limitations I've only tested it on Ubuntu 16.04 and CentOS 7.
Plus, CentOS probably needs another confirm to install dependencies even though I've set `yum install -y`.
In theory it shall work on all Debian/RHEL based Distribution.

## Offical Compilation Guide ##
You may wanna check on [Compile FFmpeg on Ubuntu, Debian, or Mint](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu)

## How to ##
Open your terminal,
```
git clone https://github.com/BennyThink/onekey-compile-ffmpeg
cd onekey-compile-ffmpeg
sudo ./onekey-ffmpeg.sh
```
and....go get some coffee. It's gonna take some time depending on your machine.

## Binaries ##
The binaries will be saved on `~/bin`.`~/bin` is included in the standard Ubuntu `$PATH` by default.
I'm just too lazy to customized `configure`.
By the way, you could even copy these binaries from `~/bin` to `/usr/bin`(or some other `$PATH`, not recommended though.

## Be aware ##
Hey dude! I'm **NOT** specialized at writting SHELL scripts, so you know...
On the one hand, this script has a lot to be improved.
On the other hand, it may fail to compile `ffmpeg non-free`.
The good news is it won't delete any files so it will do you no harm even you got extremely bad luck.

## Chinese user ATTENTION Please ##
This script will download a tar ball from *Google Cloud Storage*. Since there is GFW between your computer and Google, the download process may fail.
This script also downloads lots of source code from foreign sites, and it could end to extremely slow due to GFW.
If this happens, I suggest you find another reachable source, download via proxy server or set proxy for your terminal.

## Bug report or suggestion ##
Open an issue or [email me](mailto:benny.think@gmail.com).
Happy coding fellas!

## License ##
Use it whatever you want! Hooah!
