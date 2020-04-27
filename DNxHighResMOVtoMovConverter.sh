# Script to convert all the .mov file in a folder to mov using DNxHR codec, 
# This will transform the videos same as soruce resolution and framerate, including fullHD, 2K and 4K
# This script was created to convert the MOV files recorded using CANON camera which is encoded using
# H265 codec to MOV file encoded using dnXHR format to edit in Davinci Resolve 16, Linux free edition
# -------------------------------------------------------
for i in *.MOV;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -i "$i" -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le "${name}.mov"
done
