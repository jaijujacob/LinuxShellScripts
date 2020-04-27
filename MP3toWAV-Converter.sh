# MP3 to WAV converter - Davinci Resolve compatible
for i in *.mp3;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -i "$i" "${name}.wav"
  #ffmpeg -i "$i" -acodec pcm_u8 -ar 22050 "${name}.wav"
done

