#!/bin/sh

empty=/tmp/empty.$$

mkdir -p Build
cd Build

mkdir -p $empty
cordova create Device org.xwebview.cordova.device Device --copy-from=$empty
rmdir $empty

cd Device
cordova platform add https://github.com/xwebview/cordova-xwv.git
cordova plugin add cordova-plugin-device
cordova build ios
