#!/bin/bash
echo -e "Introduce URL: "
read url
wget -O file_html $url


# Obtener lista URL (https|http)
cat file_html | grep "a href" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" > url_list

# Rastrear string ("a href" | "http|https"), descargar archivos HTML,  y devolver enlaces encontrados a 'url_list'
declare -i i="1"
while [ $i -le "$(cat url_list | wc -l)" ]; do
x_row_url="$(sed -n "${i}p" url_list)"
wget -O "file_${i}" $x_row_url
cat "file_${i}" | grep "a href" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" >> url_list
((i++))
done




# echo -e "Introduce nombre del archivo: "
# ls -l | awk '{print $9}'
# read src
 
# i="1"
# link="0"
# while [ $i -le "$(cat url_list | wc -l)" ]; do
# link="$(sed -n "${i}p"  datos)"
# wget $link
# ((i++))
# done
