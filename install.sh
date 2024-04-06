echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
sudo install -d -m 0755 /etc/apt/keyrings
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo '
  Package: *
  Pin: origin packages.mozilla.org
  Pin-Priority: 1000
  ' | sudo tee /etc/apt/preferences.d/mozilla
sudo apt update && sudo apt upgrade -y
sudo apt install python3 python3-gi python3-pip code telegram-desktop firefox-devedition -y
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
python3 -m pip install psutil

cd Panels && sh ./configure && sudo make install && xfce4-panel-profiles load Default.tar.bz2 
 
git config --global user.email "me@drmsr.dev"
git config --global user.name "drmsr"
