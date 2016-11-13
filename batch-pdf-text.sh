#!/bin/sh

for f in $(find  -name *.pdf); do
  pdftotext $f;
  echo "extracted plain text from $f."
done

mkdir txt/
for f in $(find -name *.txt); do
  mv $f txt/;
  echo "moved $f to txt/ directory."
done