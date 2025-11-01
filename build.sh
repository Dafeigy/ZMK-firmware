#!/bin/sh
echo "Start processing Firmware build."
mkdir -p zmk-firmware
cd ./app; 

echo "Start processing left-hand Firmware.";
west build -d build/left -b nice_nano_v2 -- -DSHIELD=klotz_left; 
echo "Start processing right-hand Firmware.";
west build -d build/right -b nice_nano_v2 -- -DSHIELD=klotz_right;

cd ../;
mv ./app/build/left/zephyr/zmk.uf2 ./zmk-firmware/left.uf2;
mv ./app/build/right/zephyr/zmk.uf2 ./zmk-firmware/right.uf2;
echo "Build tasks finished. See ./zmk-firmware for details."