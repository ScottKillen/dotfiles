# vi:syntax=sh

# Source .bashrc as recommended here:
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.profile ]; then
   source ~/.profile
fi

mesg n

# run inxi information tool
if [ -x "`which inxi 2>&1`" ]; then
  printf "\n"
  inxi -IpSCi -c30
fi

printf "\n"
