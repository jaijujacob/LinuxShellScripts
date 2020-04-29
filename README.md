
# LinuxShellScripts

## Shell scripts to customize Linux desktop

>##### Present confiuration (Linux Mint 19.3, MATE edition)

1. Scripts/bashtop
    >Command line system monitor
1. Scripts/networkTraffic.sh
    >Script to find which application consume network traffic
1. Scripts/WallpaperChanger.sh
    >Script to change wallpaper every minute. Add this script to the startup applications,then it will start automatically

### Utilities

1. Scripts/DNxHighResMOVtoMovConverter.sh
    >Script to convert all the .mov file in a folder to mov using DNxHR codec, This will transform the videos same as soruce resolution and framerate, including fullHD, 2K and 4K This script was created to convert the MOV files recorded using CANON camera which is encoded using H265 codec to MOV file encoded using dnXHR format to edit in Davinci Resolve 16, Linux free edition.

    This script will work on all the files placed in current directory
    ```
    cd <where the .mov files are stored>
    . ~/Scripts/DNxHighResMOVtoMovConverter.sh
    ```
1. Scripts/DNxHighResMP4toMovConverter.sh
    >Script to convert all the .mp4 file in a folder to mov using DNxHR codec, This will transform the videos same as soruce resolution and framerate, including fullHD, 2K and 4K This script was created to convert the any MP$ files with any type of encoding to MOV files encoded using dnXHR format to edit in Davinci Resolve 16, Linux free edition.
    This script will work on all the files placed in current directory
    ```
    cd <where the .mp4 files are stored>
    . ~/Scripts/DNxHighResMP4toMovConverter.sh
    ```
1. Scripts/launchResolve.sh
    >Launcher script to open Davinci resolve with scaling factor 2 to be compatible with 4K display. Create a launcher with command pointing to this sh file or modify the existing launcher command.
1. Scripts/MP3toWAV-Converter.sh
    >Script to convert all the mp3 files stored in a directory to wav formated file.
    This script will work on all the files placed in current directory
    ```
    cd <where the .mp3 files are stored>
    . ~/MP3toWAV-Converter.sh
    ```