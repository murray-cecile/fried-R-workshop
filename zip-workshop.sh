# !/usr/bin/bash

cd ~/Documents/coding/fried-r-workshop

sourcedir=$1
zip -r  $sourcedir".zip" $sourcedir -x $@
mv *.zip WORKSHOP-MATERIALS