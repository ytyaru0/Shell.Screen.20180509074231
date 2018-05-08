#screen="ABC\nDEF"
screen="ABC\nDEF"
echo -e $screen
tput cuu 2
screen="UVW\nXYZ"
echo -e $screen
