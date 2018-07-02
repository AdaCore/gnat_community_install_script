#!/usr/bin/env sh

script_dir=$(dirname $0)

# Validate the number of arguments
if [ "$#" -ne 2 ] ; then
  echo "Usage: $0 <package_file> <target_directory>" >&2
  exit 1
fi

package_file=$1
target=$2

install_darwin() {
  # Create a mountpoint
  mountpoint=`mktemp -d`
  hdiutil attach $package_file -mountpoint $mountpoint
  if [ "$?" -ne 0 ] ; then
    echo "Could not mount the archive..." >&2
    exit 1
  fi

  base=` basename $package_file | cut -d'.' -f1 `
  $mountpoint/$base.app/Contents/MacOS/$base \
     --script $script_dir/install_script.qs \
     InstallPrefix="$target"

  umount $mountpoint
  rm -rf $mountpoint
}

install_linux() {
   echo "TODO"
}

# Make sure the target is nonexistent or empty
if [ -f "$target" ]; then
  echo "Target cannot be an existing file" >&2
  exit 1
fi

if [ -d "$target" ]; then
  ls=` ls -A "$target" `
  if [ ! -z "$ls" ]; then
     echo "Target cannot be a non-empty directory" >&2
     exit 1
  fi
fi

case `uname` in
  Darwin) install_darwin;;
  Linux) install_linux;;
  *) echo "Platform not supported" >&2 ; exit 1 ;;
esac
