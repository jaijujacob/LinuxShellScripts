# Script to change wallpaper every minute

##  Command to list all keys under a gsettings schema
#  gsettings list-keys org.mate.background
## Command to list key value of a schema
#  gsettings get org.mate.background picture-filename

# -------------------------------------------------------

while true;do
	DIR="/home/jaiju/Pictures/4KWalls"
	PIC=$(ls $DIR/*.jpg | shuf -n1)
	echo $PIC
	# Mate
	gsettings set org.mate.background picture-filename "$PIC"
	# Cinnamon
	gsettings set org.cinnamon.desktop.background picture-uri "file://$PIC"
	sleep 60
done