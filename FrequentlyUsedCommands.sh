# Davinci resolve file converter(Run on directories)
# -------------------------------------------------------
~/Scripts/DNxHighResMOVtoMovConverter.sh
~/Scripts/DNxHighResMP4toMovConverter.sh
~/Scripts/MP3toWAV-Converter.sh



#Linux package cleanup
#------------------------------------------------------
$ sudo apt-get autoclean
#Additionally, to remove the apt-cache,
$ sudo apt-get clean
#Finally, to remove the unwanted software dependencies,
$ sudo apt-get autoremove

#youtube-dl - Commands
#------------------------------------------------------
#Best Quality Video Extraction:
youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "7X71mt7N7Nk"

#Eg:- youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "X8zLJlU_-60"

#Best Audio Download:
youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 <VideoID>
#Eg:- youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 Kx1QffGmhPo


# FFMPEG usefull commands

#Steabilize Video:
ffmpeg -t 5 -i 20200725_181439.MP4 -vf vidstabdetect=stepsize=32:shakiness=10:accuracy=10:result=transform_vectors.trf -f null - 
ffmpeg -t 5 -i 20200725_181439.MP4 -y -vf vidstabtransform=input=transform_vectors.trf:zoom=0:smoothing=10,unsharp=5:5:0.8:3:3:0.4,scale=480:-1 -vcodec libx264 -tune film -an stabilized.mp4

#Steabilize Video: with different params
ffmpeg -i 20200725_181439.MP4 -vf vidstabdetect=stepsize=32:shakiness=10:accuracy=10:result=transform_vectors.trf -f null -
ffmpeg -i 20200725_181439.MP4 -vf vidstabtransform=input=transform_vectors.trf:zoom=0:smoothing=10,unsharp=5:5:0.8:3:3:0.4 -vcodec libx264 -tune film -acodec copy -preset slow stabilized.mp4

# Deshake video (stabalize):
ffmpeg -i input.mov -vf deshake output.mov

# Make video from image sequence:
ffmpeg -i frame_%04d.png -c:v h264 test.mp4

# lossless h264:
ffmpeg -i frame%04d.png -c:v libx264 -preset veryslow -qp 0 vid.mkv
ffmpeg -i frame%04d.png -c:v libx264 -preset ultrafast -qp 0 vid.mkv – larger file size, but quicker to encode

# Make image sequence from video:
ffmpeg -i video.avi image%04d.png
ffmpeg -i video.avi .\imgs\image%04d.png #– outputs the images to a folder (the folder must already exist!)


ffmpeg -v warning -i MyAtion.mp4 -i MyAtion2.mp4 -filter_complex '[0:v]scale=400:400,pad=800:400 [0:q]; [1:v]scale=400:400[1:q]; [0:q][1:q]overlay=400:0' -f nut -c:v rawvideo -c:a copy - | mplayer -noconsolecontrols -cache-min 1 -cache 1024000 -

# Combining 3 videos together
ffmpeg -i MyAtion2.mp4 -i Kayaking.mp4 -i MyAtion.mp4 -filter_complex "[1:v][0:v]scale2ref=oh*mdar:ih[1v][0v];[2:v][0v]scale2ref=oh*mdar:ih[2v][0v];[0v][1v][2v]hstack=3,scale='2*trunc(iw/2)':'2*trunc(ih/2)'" final.mp4

# Combining Two
ffmpeg -i MyAtion.mp4 -i MyAtion2.mp4 -filter_complex hstack output2.mp4

# Converting to image
ffmpeg -i video.mpg image%d.jpg

# Resize a Video
# Using the -vf scale filter, it is possible to resize videos to a desired size:
ffmpeg -i input.avi -vf scale=320:240 output.avi


# Extract a Portion of a Video
# Another very common operation on video files is to extract a specific portion of a given video. This can be done super easily:
ffmpeg -ss 00:00:30 -i orginalfile.mpg -t 00:00:05 -vcodec copy -acodec copy newfile.mpg


# Extract Sound From a Video, And Save It in Mp3 Format
# Creating an audio file from a video is an easy task:

ffmpeg -i source_video.avi -vn -ar 44100 -ac 2 -ab 192k -f mp3 sound.mp3


# Image Overlay on a Video
# Let’s finish this round-up with an advanced command. Here we are applying an overlay image to an existing video:

ffmpeg -i input.mp4 -i image.png -filter_complex "[0:v][1:v] overlay=25:25:enable='between(t,0,20)'" -pix_fmt yuv420p -c:a copy output.mp4


# Python Virtual Environment Switching
# -------------------------------------------------------
conda create -n cognitivesuite python=3.5
source activate congnitivesuite
source activate cognitivesuite

#Checking network usage by application;
#-------------------------------------------------------
nethogs -a


#XORG Backup
#-------------------------------------------------------
#(backup the old xorg.conf if you already have it):

sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.old
#(then run):
sudo cp /home/jaiju/Desktop/xorg.conf /etc/X11/xorg.conf


#Postgress SQL
#-------------------------------------------------------
# one way to issue the commands you typed in the video to start, stop, restart PostgreSQL in Linux is: 
sudo systemctl start postgresql     # starts the server
sudo systemctl stop postgresql      # stops it
sudo systemctl restart postgresql   # restart it
sudo systemctl status postgresql    # check the server's status

#The "createdb test " command and the "psql 'test' " command are the same (at least for Debian/Ubuntu systems) from what I saw. 
createdb test
psql 'test'

#When it's first installed, PostgreSQL just has the 'postgres' user, and the way to initially enter PostgreSQL 
# is by typing  sudo su - postgres , and then psql .  After Andrei creates the 'test' database, we can create a 
# user with the same name as our current logged in user, to be a database administrator. This way we can just 
# type in psql 'test'  from the command line and enter the database without the need of logging in as the 
# 'postgres' user, just like Andrei does in the lecture. This can be done with CREATE USER your-user-name-here 
# WITH SUPERUSER; , and we can verify that he was created with \du . Now we can exit by typing \q  and then exit , 
# and enter our database just like Andrei does, with psql 'test' . 
#Lastly, with pgAdmin4 we need to create a connection with the server the first time we use it, and this is done 
# by right-clicking 'Servers' on the left pane, and choosing 'Create' > 'Server'. We give our server a name, 
# and in the 'Connection' tab we type in 'localhost' as the host, just like Andrei shows in the lecture, 
# and press 'Save'. 

sudo su - postgres


# ffmpeg Commands
#-------------------------------------------------------

ffmpeg -i 20200329_120646.mp4 -vcodec dnxhd -acodec pcm_s16le -s 1920x1080 -r 30000/1001 -b:v 36M -pix_fmt yuv422p -f mov 20200329_120646.mov

# 4K 
for i in *.mp4;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -i "$i" input-video.mp4 -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le "${name}.mov"
done


input-video.mp4 -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le


# 4K

ffmpeg -i 20200329_130032.mp4 -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le 20200329_130032.mov
ffmpeg -i input-video.mp4 -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le output-video.mov
ffmpeg -i input.mkv -map 0:0 -map 0:1 -map 0:2 -vcodec dnxhd -acodec:0 pcm_s16le -acodec:1 pcm_s16le -s 1920x1080 -r 30000/1001 -b:v 36M -pix_fmt yuv422p -f mov output.mov
ffmpeg -i AlitaRamboNote9QHD.mov -vcodec h264 -acodec mp3 AlitaRamboNote9QHD.mp4

# For WhatsApp compatibility
ffmpeg -i TimeToCoolOff.mp4 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p TimeToCoolOff2.mp4
ffmpeg -i TimeToCoolOff.mp4 -c:v libx264 -c:a aac TimeToCoolOff2.mp4
ffmpeg -i Under_the_Gun.mp3 Under_the_Gun.wav 
ffmpeg -i TimeToCoolOff.mp3 -acodec pcm_u8 -ar 22050 TimeToCoolOff.wav


# Setting up Git 
#-------------------------------------------------------
git config --global user.name "Jaiju Jacob"
git config --global user.email "joeofcochin@gmail.com"
git config --global branch.autosetuprebase always
git config --global color.ui true
git config --global color.status auto
git config --global color.branch auto
git config --global core.editor vim
git config --global merge.tool vimdiff
git config --list

# rolling back last commit without losing the changes made () 
# purpose is mainly removing unwanted filese from staged file or not maing unwanted commits
#--------------------------------------------------------
git reset --soft HEAD~1
# unstage the files
git reset HEAD <file> # or . to unstage all
# removing files from staging area
git rm --cached -r . # all files or individual files