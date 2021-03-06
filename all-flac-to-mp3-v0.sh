#!/bin/bash
#converts and replaces all flac files in current directory with mp3 (V0) including metadata 
find . -type f -name '*.flac' -print0 | while IFS= read -r -d $'\0' file; do echo "processing ${file}"; ffmpeg -y -i "${file}" -loglevel error -codec:a libmp3lame -q:a 0 -map_metadata 0 -id3v2_version 3 "${file%.*}.mp3" < /dev/null > /dev/null && rm "${file}"; done
