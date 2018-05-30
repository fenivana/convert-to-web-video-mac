cd `dirname $0`
inputFile=$1
outputFile=${inputFile%.*}-720p-web.mp4
echo -n -e "\033]0;$inputFile\007"
./ffmpeg -i "$inputFile" -c:v libx264 -profile:v high -level 4.1 -vf "format=yuv420p,scale='min(1280,iw)':'min(720,ih)':force_original_aspect_ratio=decrease" "$outputFile"
echo "Done. File output to $outputFile"
read -rsn1 -p "Press any key to close..."
osascript -e "tell application \"Terminal\" to close (every window whose name contains \"$inputFile\")" & exit
