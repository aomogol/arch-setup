#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#create a file called .bashrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.
[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal
# neofetch


# export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
# export PATH=$JAVA_HOME/bin:$PATH
# export FLUTTER_HOME=/opt/flutter
# export PATH=${PATH}:${FLUTTER_HOME}/bin
# export CHROME_EXECUTABLE=/opt/google/chrome/chrome
# export ANDROID_SDK_ROOT='/home/aom/Android/Sdk'
#export ANDROID_SDK_ROOT='/opt/android-sdk'
# export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
# export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
# export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
# export PATH=$PATH:$ANDROID_SDK_ROOT/tools/
#PATH=$ANDROID_HOME/emulator:$PATH

source ~/.aom-prompt.sh
