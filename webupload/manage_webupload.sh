#!/bin/bash

DIR="/var/lib/docker/volumes/webupload"
folders=(bb_files collab logs)
if [ ! -d "$DIR" ]; then
  docker volume create webupload

cd /var/lib/docker/volumes/webupload/_data

mkdir webupload
cd webupload

for i in "${folders[@]}"
do
        mkdir "${i}"
        touch ${i}/"${i}.txt"

done

chmod -R 777 /var/lib/docker/volumes/webupload

else

echo "volume webupload already exists"

fi
~     