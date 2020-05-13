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
youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "YouTubeVideoID"

#Eg:- youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "X8zLJlU_-60"

#Best Audio Download:
youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 <VideoID>
#Eg:- youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 Kx1QffGmhPo


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