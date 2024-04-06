echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
sudo install -d -m 0755 /etc/apt/keyrings
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo '
  Package: *
  Pin: origin packages.mozilla.org
  Pin-Priority: 1000
  ' | sudo tee /etc/apt/preferences.d/mozilla
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\


sudo apt update && sudo apt upgrade -y
sudo apt install python3 python3-gi pip code telegram-desktop firefox-devedition nodejs -y
python3 -m pip install psutil

cd Panels && sh ./configure && sudo make install && xfce4-panel-profiles load Default.tar.bz2 
 
git config --global user.email "me@drmsr.dev"
git config --global user.name "drmsr"

xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorDUMMY0/workspace0/last-image -s ~/projects/nvi/background.jpg

cd ~/Desktop && rm -rf *
