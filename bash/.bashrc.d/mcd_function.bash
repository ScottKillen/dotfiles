#-------------------------------------------------------------
# mcd: create directory and move there
#-------------------------------------------------------------
mcd () {
  if [ $# -ne 1 ]; then
    echo "Usage: mcd <directory-name>"
    return
  fi

  mkdir --parents $1
  cd $1
}
