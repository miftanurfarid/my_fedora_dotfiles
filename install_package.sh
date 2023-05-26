#!/bin/bash

# dnf setup
cat dnf.txt > /etc/dnf/dnf.conf

# initial upgrade
dnf upgrade -y --refresh

# add rpmfusion
rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install All Package
dnf install -y texlive-scheme-full texlive-IEEEtran texlive-babel-bahasa texlive-lipsum texlive-extarrows lyx octave python3-spyder htop inkscape texstudio xournalpp qpdfview-qt5 gimp libreoffice-Mendeley torbrowser-launcher axel neofetch vlc telegram-desktop rclone calibre gnome-tweaks unrar jupyter-notebook okular btrfs-assistant transmission cabextract xorg-x11-font-utils redhat-lsb-core gstreamer1-plugin-openh264 mozilla-openh264 neovim vim steam pdftk gparted playonlinux
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
dnf install -y code
rpm --import https://dl.google.com/linux/linux_signing_key.pub
axel -a https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
dnf install -y google-chrome-stable_current_x86_64.rpm
rm google-chrome-stable_current_x86_64.rpm
dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
dnf install -y brave-browser
dnf install -y https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
cd ttf-wps-fonts
./install.sh
cd ..
