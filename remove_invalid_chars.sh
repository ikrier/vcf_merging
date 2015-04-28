#!/bin/bash

file=$1

zcat $file |tr -d '[\200-\377]'|sed -r 's/\?//g'|sed -r 's/Description=/Description="/g'|sed -r 's/>/">/g'|gzip >$file.tmp
mv $file.tmp $file
