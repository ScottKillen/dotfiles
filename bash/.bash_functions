# vim: ai ts=2 sw=2 et sts=2 ft=sh

#-------------------------------------------------------------
# mcd: create directory and move there
#-------------------------------------------------------------
mcd () {
  mkdir -p $1
  cd $1
}

#-------------------------------------------------------------
# pathadd: append $1 to $PATH if not already there
#-------------------------------------------------------------
pathadd()
{
  [[ ":$PATH:" =~ ":$1:" ]] || PATH=$PATH${PATH:+:}$1  # append if NOT already in PATH, suppress first ':'
}

#-------------------------------------------------------------
# addpath: prepend $1 to $PATH if not already there
#-------------------------------------------------------------
addpath()
{
  [[ ":$PATH:" =~ ":$1:" ]] || PATH=$1${PATH:+:}$PATH  # prepend if NOT already in PATH, suppress first ':'
}

#-------------------------------------------------------------
# allcolors: display all terminal colors
#-------------------------------------------------------------
function allcolors() {
  # credit to http://askubuntu.com/a/279014
  for x in 0 1 4 5 7 8; do
    for i in `seq 30 37`; do
      for a in `seq 40 47`; do
        echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
      done
      echo
    done
  done
  echo ""
}
