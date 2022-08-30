#!/bin/bash
echo -e "Introduce URL: "
read url
wget -O test_url $url

echo -e "Introduce nombre del archivo: "
ls -l | awk '{print $9}'
read src

cat $src | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*.png" > datos

declare -i i="1"
link="0"
while [ $i -le "$(cat datos | grep ".png" | wc -l)" ]; do
link="$(sed -n "${i}p"  datos)"
wget $link
((i++))
done
