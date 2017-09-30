## Installation:<br>
First clone the repository:<br>
```git clone https://github.com/Eayu/sddm-theme-clairvoyance```<br><br>
Make sure that you have both sddm and qt5 installed. On arch:<br>
```sudo pacman -S sddm qt5```<br><br>
Then move it to the sddm-themes directory:<br>
```sudo mv sddm-theme-clairvoyance /usr/share/sddm/themes/clairvoyance```<br><br>
Then set the current theme to clairvoyance in sddm.conf:<br>
```sudo vim /etc/sddm.conf```<br>
and set "Current" equal to "clairvoyance" (no speech marks).

## Video example:
Click the image to see the video:

[![Alt text](clairvoyance_screenshot.png?raw=true "Click to see video")](clairvoyance_example.webm?raw=true)

## Credits

I shamelessly stole the power icons (shutdown restart etc.) from https://github.com/Match-Yang/sddm-deepin .
