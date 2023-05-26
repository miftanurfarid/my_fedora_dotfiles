#!/bin/bash

# install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.mattjakeman.ExtensionManager
flatpak install -y flathub org.onlyoffice.desktopeditors
flatpak install -y flathub com.wps.Office
flatpak install -y flathub com.bitwarden.desktop
flatpak install -y flathub com.elsevier.MendeleyDesktop
flatpak install -y flathub us.zoom.Zoom
flatpak install -y flathub io.github.shiftey.Desktop

# install snap
dnf install snapd
ln -s /var/lib/snapd/snap /snap
snap install superproductivity
snap install spotify
