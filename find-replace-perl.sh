#!/bin/bash

## This script takes three arguments: term to fin, term to replace, and the filename.

echo
if (( $# != 3 )); then
  echo -e "This script takes three arguments: term to find, term to replace it with, then the filename."
  echo -e "Ex:     ./find-replace-perl.sh find replace file.txt"
  echo
  exit;
else echo "replacing \"$1\" with \"$2\" in the file \"$3\"."
fi
echo

perl -pe 's/'$1'/'$2'/g;' $3
