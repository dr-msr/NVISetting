 sudo apt update && sudo apt upgrade -y
 sudo apt install python3 python3-gi python3-pip
 cd Panels && sh ./configure && sudo make install && xfce4-panel-profiles load Default.tar.bz2 