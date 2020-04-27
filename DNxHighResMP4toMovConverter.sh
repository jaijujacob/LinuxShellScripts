# Script to convert all the .mp4 file in a folder to mov using DNxHR codec, which will transform the videos same as soruce resolution and framerate, including fullHD, 2K and 4K
for i in *.mp4;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -i "$i" -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le "${name}.mov"
done
