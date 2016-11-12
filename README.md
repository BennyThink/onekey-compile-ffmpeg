# onekey-compile-ffmpeg
A onekey shell script to compile ffmpeg non-free on Debian/Ubuntu/Mint.

##Description##

As you may see from the title, this is a onekey onekey shell script to compile `ffmpeg non-free` on Debian/Ubuntu/Mint.<br>
With this you could compile `ffmpeg` along with `x264, x265, aac, lame, VP8/9, opus` which is apparently non-free!

##Distribution##
Due to my limitations I've only tested it on Ubuntu 16.04 64Bit.<br>
In theory it shall work on all Debian based Distribution.

##Offical Compilation Guide##
You may wanna check on [Compile FFmpeg on Ubuntu, Debian, or Mint](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu)

##How to##
Open your terminal,<br>
`git clone https://github.com/BennyThink/onekey-compile-ffmpeg`<br>
then<br>
`cd onekey-compile-ffmpeg`<br>
`sudo ./onekey-ffmpeg.sh`<br>
and....go get some coffee.<br>

##Binaries##
The binaries will be saved on `~/bin`.`~/bin` is included in the standard Ubuntu `$PATH` by default.<br>
I'm just too lazy to customized `configure`.
By the way, you could even copy these binaries from `~/bin` to `/bin`.

##Be aware##
Hey dude! I'm *NOT* specialized at writting SHELL scripts, so you know...<br>
On the one hand, this script has a lot to be improved.<br>
On the other hand, it may fail to compile `ffmpeg non-free`.<br>
The good news is it won't delete any files so it will do you no harm even you got extremely bad luck.

##Chinese user ATTENTION Please##
This script will download a tar ball from *Google Cloud Storage*.<br>
Since there is GFW between your computer and Google, the download process may fail.<br>
If this happens, I suggest you find another reachable source, download via proxy server or set proxy for your terminal.<br>

##Bug report or suggestion##
Open an issue or [email me](mailto:benny.think@gmail.com).
Happy coding fellas!

##License##
GPL v3.
