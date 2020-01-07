#!/bin/bash

function linkIt() {
  lib=$1
  origLib=$(ls  $(echo "/usr/lib/"$lib".so*") | head -1)
  ln -s $origLib "/usr/lib/"$lib".so"
}

linkIt "libfreetype"
linkIt "libpng16"
linkIt "libwebp"
linkIt "libjpeg"

## very, very stupid
ln -s /usr/lib/libzstd.so.1 /usr/lib/libz.so

