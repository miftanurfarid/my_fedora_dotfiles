#!/bin/bash

# Text decoration
Red="\033[0;31m"
Bold="\033[1m"
Color_Off="\033[0m"
Cyan="\033[0;36m"
Green="\033[0;32m"

# Find Cisco Packet Tracer installer
installer_name_1=CiscoPacketTracer*Ubuntu_64bit.deb
installer_name_2=Cisco_Packet_Tracer_*_Ubuntu_64bit_*.deb
installer_name_3=Cisco*.deb
path_to_pt=$(find /home -name $installer_name_1 -o -name $installer_name_2 -o -name $installer_name_3)

if [[ -z "$path_to_pt" ]]; then
    echo -e "\n\n${Red}${Bold}Packet Tracer installer not found in /home. It must be named like this: $installer_name_1.$Color_Off\n"
    echo -e "You can download the installer from ${Cyan}https://www.netacad.com/portal/resources/packet-tracer${Color_Off} \
or ${Cyan}https://skillsforall.com/resources/lab-downloads${Color_Off} (login required)."
    exit 1
else
    echo -e "\nThe Packet Tracer installer was found at:"
    echo -e "${Green}${Bold}$path_to_pt${Color_Off}\n"
    sleep 3
fi

echo "Removing old version of Packet Tracer from /opt/pt"
sudo bash ./uninstall.sh

echo "Installing dependencies"
sudo dnf -y install binutils qt5-qt{multimedia,webengine,networkauth,websockets,webchannel,script,location,svg,speech}

echo "Extracting files"
mkdir packettracer
ar -x $path_to_pt --output=packettracer
tar -xvf packettracer/control.tar.xz --directory=packettracer
tar -xvf packettracer/data.tar.xz --directory=packettracer

sudo cp -r packettracer/usr /
sudo cp -r packettracer/opt /
sudo sed -i 's/packettracer/packettracer --no-sandbox args/' /usr/share/applications/cisco-pt.desktop
sudo sed -i 's/sudo xdg-mime/sudo -u $SUDO_USER xdg-mime/' ./packettracer/postinst 
sudo sed -i 's/sudo gtk-update-icon-cache --force/sudo gtk-update-icon-cache -t --force/' ./packettracer/postinst
sudo ./packettracer/postinst

sudo rm -rf packettracer
