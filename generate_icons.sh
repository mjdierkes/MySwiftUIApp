#!/bin/bash

# Create a temporary base icon
convert -size 1024x1024 xc:white \
        -fill '#007AFF' -draw 'circle 512,512 512,256' \
        -fill white -draw 'circle 512,512 512,384' \
        -fill '#007AFF' -pointsize 200 -gravity center -draw "text 0,0 'M'" \
        Sources/Assets.xcassets/AppIcon.appiconset/icon_1024.png

# Generate all required sizes
cd Sources/Assets.xcassets/AppIcon.appiconset
sizes=(20 29 40 58 60 76 80 87 120 152 167 180)
for size in "${sizes[@]}"; do
    convert icon_1024.png -resize ${size}x${size} icon_${size}.png
done 