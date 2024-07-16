sudo apt-get update

sudo apt-get -y upgrade

sudo apt install -y bluez-tools bluez-hcidump libbluetooth-dev \
                    git gcc python3-pip python3-setuptools \
                    python3-pydbus

git clone https://github.com/pybluez/pybluez.git
cd pybluez
sudo python3 setup.py install

cd ~/
git clone --depth=1 https://github.com/bluez/bluez.git
gcc -o bdaddr ~/bluez/tools/bdaddr.c ~/bluez/src/oui.c -I ~/bluez -lbluetooth
sudo cp bdaddr /usr/local/bin/

cd 

sudo systemctl enable bluetooth

sudo systemctl start bluetooth.service
