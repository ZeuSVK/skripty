#!/bin/sh
dnf install epel-release -y
dnf --enablerepo=epel group
dnf install dnf-plugins-core -y
dnf config-manager --set-enabled powertools
dnf groupinstall "Xfce" "base-x" -y
echo "exec /usr/bin/xfce4-session" >> ~/.xinitrc
systemctl set-default graphical
dnf -y groupinstall "Development Tools"
dnf -y install https://pkgs.dyn.su/el8/base/x86_64/raven-release-1.0-2.el8.noarch.rpm
dnf --enablerepo=raven-multimedia
dnf --enablerepo=raven-extras
dnf install -y otter-browser
dnf install -y xcb-util xterm
dnf install -y https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/x/xpdf-3.04-10.el7.x86_64.rpm
dnf install -y libxfce4ui
dnf install -y xfce4-session
dnf install -y https://pkgs.dyn.su/el8/base/x86_64/libwnck-2.31.0-16.el8.x86_64.rpm
echo "xpdf" > /etc/dnf/protected.d/xpdf.conf
echo "libQt5WebEngineWidgets" > /etc/dnf/protected.d/libQt5WebEngineWidgets
echo "libQt5Multimedia" > /etc/dnf/protected.d/libQt5Multimedia.conf
echo "libQt5WebEngineCore" > /etc/dnf/protected.d/libQt5WebEngineCore.conf
echo "xorg-x11-fonts-ISO8859-1-100dpi" > /etc/dnf/protected.d/xorg-x11-fonts-ISO8859-1-100dpi.conf
echo "xorg-x11-fonts-ISO8859-1-75dpi" > /etc/dnf/protected.d/xorg-x11-fonts-ISO8859-1-75dpi.conf
echo "xorg-x11-server-Xorg" > /etc/dnf/protected.d/xorg-x11-server-Xorg.conf
echo "xorg-x11-server-Xwayland" > /etc/dnf/protected.d/xorg-x11-server-Xwayland.conf
echo "sudo" > /etc/dnf/protected.d/sudo.conf
echo "dnf" > /etc/dnf/protected.d/dnf.conf
echo "Xfce" > /etc/dnf/protected.d/Xfce.conf
echo "xorg-x11-xinit" > /etc/dnf/protected.d/xorg-x11-xinit.conf
echo "xterm" > /etc/dnf/protected.d/xterm.conf
echo "NetworkManager" > /etc/dnf/protected.d/NetworkManager.conf
echo "bash" > /etc/dnf/protected.d/bash.conf
echo "otter-browser" > /etc/dnf/protected.d/otter-browser.conf
echo "xorg-x11-xinit" > /etc/dnf/protected.d/xorg-x11-xinit.conf
echo "Xorg" > /etc/dnf/protected.d/Xorg.conf
echo "xorg-x11-xinit-session" > /etc/dnf/protected.d/xorg-x11-xinit-session.conf
echo "openssh-server" > /etc/dnf/protected.d/openssh-server.conf
echo "openssh-clients" > /etc/dnf/protected.d/openssh-clients.conf
echo "libwnck-2.31.0-16" > /etc/dnf/protected.d/libwnck-2.31.0-16.conf
echo "wget" > /etc/dnf/protected.d/wget.conf
echo "xfce4-session" > /etc/dnf/protected.d/xfce4-session.conf
echo "libxfce4ui" > /etc/dnf/protected.d/libxfce4ui.conf
#ochrana priečinka pred odstránením
chattr +i /usr/bin/xfce4-session
#pridanie užívateľa
adduser test
#zistenie všetkých nainštalovaných balíčkov
yum list installed > installed.txt
gawk '{print "yum autoremove -y "$0}' installed.txt > installed1.txt
sed 's/\.x86_64.*/.x86_64/' installed1.txt > installed2.txt
sed 's/\.noarch.*/.noarch/' installed2.txt > installed3.txt
#spustenie skriptu
find /var/log -name ‘*.log*’ -delete
find /boot -name *rescue* -delete
sh installed3.txt
dnf -y install https://pkgs.dyn.su/el8/base/x86_64/raven-release-1.0-2.el8.noarch.rpm
dnf --enablerepo=raven-multimedia
dnf --enablerepo=raven-extras
dnf install -y libxfce4ui
dnf install -y xfce4-session
dnf install -y https://pkgs.dyn.su/el8/base/x86_64/libwnck-2.31.0-16.el8.x86_64.rpm
cd /boot
wget https://github.com/ZeuSVK/skripty/raw/main/kernel.bash
sed s/\vmlinuz-4.18.0-383.el8.x86_64/vmlinuz-$(uname -r)/ kernel.bash > kernel1.bash
sed s/\initramfs-4.18.0-383.el8.x86_64/initramfs-$(uname -r)/ kernel1.bash > kernel2.bash
sed s/\config-4.18.0-383.el8.x86_64/config-$(uname -r)/ kernel2.bash > kernel3.bash
shopt -s extglob
sh kernel3.bash
