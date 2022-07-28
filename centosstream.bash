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
echo "accountsservice" > /etc/dnf/protected.d/accountsservice.conf
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
cd /home/test
wget https://github.com/ZeuSVK/skripty/raw/main/bsos.pdf
rm -rfv ./.cache
rm -rfv ./.mozilla
rm -rfv /var/cache/*
rm -rfv /etc/firewalld/
rm -rfv /etc/services
rm -rfv /etc/udev
rm -rfv /home/test/.cache/*
rm -rfv /home/test/.local/
rm -rfv /home/test/rpmbuild/sources
rm -rfv /home/rpmbuild/sources
rm -rfv /lib/modules
rm -rfv /lib64/bluetooth
rm -rfv /lib64/dri/i965_dri.so
rm -rfv /lib64/dri/nouveau_dri.so
rm -rfv /lib64/dri/r600_dri.so
rm -rfv /lib64/dri/radeonsi_dri.so
rm -rfv /lib64/dri/virtio_gpu_dri.so
rm -rfv /lib64/dri/vmwgfx_dri.so
rm -rfv /lib64/games
rm -rfv /root/.cache
rm -rfv /root/.mozilla
rm -rfv /root/Downloads
rm -rfv /root/mozilla
rm -rfv /root/rpmbuild/SOURCES
rm -rfv /run/log/journal
rm -rfv /run/udev
rm -rfv /usr/bin/aspell
rm -rfv /usr/bin/brotli
rm -rfv /usr/bin/gawk
rm -rfv /usr/bin/gcm-picker
rm -rfv /usr/bin/gnome-control-center
rm -rfv /usr/bin/gnome-keyring-daemon
rm -rfv /usr/bin/gnome-logs
rm -rfv /usr/bin/gpg
rm -rfv /usr/bin/gpgv
rm -rfv /usr/bin/grep
rm -rfv /usr/bin/hcidump
rm -rfv /usr/bin/l2test
rm -rfv /usr/bin/mwm
rm -rfv /usr/bin/nautilus
rm -rfv /usr/bin/nmcli
rm -rfv /usr/bin/nm-connection-editor
rm -rfv /usr/bin/python3.6
rm -rfv /usr/bin/vi
rm -rfv /usr/include
rm -rfv /usr/lib/girepository-1.0
rm -rfv /usr/lib/gnome-shell
rm -rfv /usr/lib/gpg
rm -rfv /usr/lib/locale
rm -rfv /usr/lib/modules/
rm -rfv /usr/lib/python3.6/site-packages
rm -rfv /usr/lib/qt5/bin
rm -rfv /usr/lib/udev/hwdb.d/
rm -rfv /usr/lib64/aspell-0.60
rm -rfv /usr/lib64/cmake
rm -rfv /usr/lib64/evolution-data-server
rm -rfv /usr/lib64/firefox
rm -rfv /usr/lib64/gconv
rm -rfv /usr/lib64/gio
rm -rfv /usr/lib64/girepository-1.0
rm -rfv /usr/lib64/gnome-keyring
rm -rfv /usr/lib64/gnome-shell
rm -rfv /usr/lib64/libbluetooth.so.3.19.4
rm -rfv /usr/lib64/libbrotlienc.so.1.0.6
rm -rfv /usr/lib64/libdb.so.2.3.0
rm -rfv /usr/lib64/libdw-0.185.so
rm -rfv /usr/lib64/libedataserver-1.2.so.23.0.0
rm -rfv /usr/lib64/libfdisk.so.1.1.0
rm -rfv /usr/lib64/libgdk-x11-2.0.so.0.2400.32
rm -rfv /usr/lib64/libgnome-desktop-3.so.17.0.6
rm -rfv /usr/lib64/libldb.so.2.3.0
rm -rfv /usr/lib64/libLLVM-12.so
rm -rfv /usr/lib64/libnss_resolve.so.2
rm -rfv /usr/lib64/libpoppler.so.104.0.0
rm -rfv /usr/lib64/libQt5Designer.so.5.15.2
rm -rfv /usr/lib64/libsamba-util.so.0.0.1
rm -rfv /usr/lib64/libsamba-util.so.1.0.28
rm -rfv /usr/lib64/libsolv.so.1
rm -rfv /usr/lib64/mutter-4
rm -rfv /usr/lib64/python3.6
rm -rfv /usr/lib64/qt5/bin
rm -rfv /usr/lib64/qt5/plugins/bearer
rm -rfv /usr/lib64/qt5/plugins/geoservices
rm -rfv /usr/lib64/qt5/qml
rm -rfv /usr/lib64/rsyslog
rm -rfv /usr/lib64/samba
rm -rfv /usr/libexec/gnome-session-binary
rm -rfv /usr/libexec/nm-iface-helper
rm -rfv /usr/libexec/nm-initrd-generator
rm -rfv /usr/sbin/gdm
rm -rfv /usr/sbin/ldconfig
rm -rfv /usr/share/anaconda
rm -rfv /usr/share/applications
rm -rfv /usr/share/backgrounds
rm -rfv /usr/share/doc
rm -rfv /usr/share/gcc-8
rm -rfv /usr/share/glib-2.0
rm -rfv /usr/share/gnome
rm -rfv /usr/share/gnome-control/center
rm -rfv /usr/share/gnome-control-center
rm -rfv /usr/share/gnome-session
rm -rfv /usr/share/gnome-shell
rm -rfv /usr/share/gnupg
rm -rfv /usr/share/help/*
rm -rfv /usr/share/hwdata/
rm -rfv /usr/share/ibus/*
rm -rfv /usr/share/icons
rm -rfv /usr/share/info
rm -rfv /usr/share/libthai
rm -rfv /usr/share/licenses/libjpeg-turbo/
rm -rfv /usr/share/locale/*
rm -rfv /usr/share/man
rm -rfv /usr/share/mime/text
rm -rfv /usr/share/misc
rm -rfv /usr/share/myspell
rm -rfv /usr/share/otter-browser/locale
rm -rfv /usr/share/plymouth
rm -rfv /usr/share/polkit-1
rm -rfv /usr/share/poppler
rm -rfv /usr/share/themes/Adwaita
rm -rfv /usr/share/vim
rm -rfv /usr/share/X11/locale
rm -rfv /usr/share/xfce4/helpers
rm -rfv /usr/share/xpdf/chinese/simplified
rm -rfv /usr/share/xpdf/chinese
rm -rfv /usr/share/xpdf/japanese
rm -rfv /usr/sher/myspell
rm -rfv /var/adm
rm -rfv /var/cache/*
rm -rfv /var/ftp
rm -rfv /var/games
rm -rfv /var/gopher
rm -rfv /var/ib/gdm
rm -rfv /var/lib/bluetooth
rm -rfv /var/lib/flatpak
rm -rfv /var/lib/gdm
rm -rfv /var/lib/rpm
rm -rfv /var/local
rm -rfv /var/lock
rm -rfv /var/log/anaconda
rm -rfv /var/log/messages
rm -rfv /var/log/sssd
rm -rfv /var/mail
rm -rfv /var/nis
rm -rfv /var/opt
rm -rfv /var/preserve
rm -rfv /var/spool
rm -rfv /var/tp
rm -rfv /var/yp
rm -rfv /var/zp
rm -rfv /usr/share/licenses
rm -rfv /usr/share/zoneinfo
rm -rfv /home/test/.cache
rm -rfv /usr/share/sounds
rm -rfv /run/log
rm -rfv /tmp
rm -rfv /var/cache
rm -rfv ¬/.cache
rm -rfv ¬/.local
rm -rfv ¬/Downloads
rm -rfv /usr/lib64/dri/crocus_dri.so
rm -rfv /usr/share/licenses
rm -rfv /usr/share/zoneinfo
rm -rfv /home/test/.cache
rm -rfv /usr/share/sounds
rm -rfv /usr/share/themes
rm -rfv /run/log
rm -rfv /tmp
rm -rfv /var/cache
rm -rfv ¬/.cache
rm -rfv ¬/.local
rm -rfv ¬/Downloads
rm -rfv /usr/lib64/dri/crocus_dri.so
cd /root
wget https://github.com/ZeuSVK/skripty/raw/main/du.bash
rm -rfv /usr/share/cracklib
rm -rfv /usr/lib64/dri/iris_dri.so
rm -rfv /usr/lib64/dri/kms_swarst_dri.so
rm -rfv /usr/lib64/javascriptcoregtk-4.0.so.18
rm -rfv /var/lib/sss
rm -rfv /var/lib/dnf
rm -rfv /var/libexec/bluetooth
rm -rfv /var/lib64/nss
rm -rfv /usr/share/mime
rm -rfv /var/lib64/libgtk-3.so.0
rm -rfv /var/lib64/libgtk-3.so.0.2200.30
rm -rfv /usr/lib/.build-id
rm -rfv /usr/lib/dracut
rm -rfv /usr/lib/rpm/platform
rm -rfv /usr/lib64/spa-0.2
rm -rfv /usr/share/pulseaudio
rm -rfv /usr/local
rm -rfv /usr/share/color
rm -rfv /usr/share/colord
rm -rfv /usr/share/libquvi-scripts
rm -rfv /usr/share/factory
rm -rfv /var/lib64/ldb
rm -rfv /usr/share/iso-codes
rm -rfv /usr/share/gdb
rm -rfv /usr/lib64/gtk-2.0
rm -rfv /usr/lib64/gtk-3.0
rm -rfv /usr/lib64/gstreamer-1.0
rm -rfv /usr/lib64/pulse-14.0
rm -rfv /usr/lib64/lua
rm -rfv /usr/lib64/librsvg-2.so.2
rm -rfv /usr/lib64/libmozjs-60.so.0.0.0
find /usr/lib64/ -type f -name "libpipe*" -print -delete
rm -rfv /usr/lib64/gnome-settings-daemon-3.0
find /usr/lib64/ -type f -name "libgtk*" -print -delete
find /usr/lib64/ -type f -name "*bluetooth*" -print -delete
find /usr/lib64/ -type f -name "*gnome*" -print -delete
find /usr/lib64/ -type f -name "*polkit*" -print -delete
find /usr/lib64/ -type f -name "*samba*" -print -delete
find /usr/lib64/ -type f -name "*libcol*" -print -delete
find /usr/lib64/ -type f -name "*jpg*" -print -delete
find / -iname "*jpg*" -print -delete
rm -rfv /usr/share/themes
find / -name "*svg*" -print -delete
find / -name "*icon*" -print -delete
find / -name "*gtk*" -print -delete
find / -name "*LLVM*" -print -delete
find / -name "*libbluetoth*" -print -delete
find / -name "*girepository*" -print -delete
find / -name "*aspell*" -print -delete
find / -name "*libdb-*" -print -delete
find / -name "*libedataserver*" -print -delete
find / -name "*libfdisk*" -print -delete
find / -name "*libgdk*" -print -delete
find / -name "*libgnome*" -print -delete
find / -name "*libldb*" -print -delete
find / -name "*evolution*" -print -delete
find / -name "*libpoppler*" -print -delete
find / -name "*libQtDesigner*" -print -delete
find / -name "*libsamba-util*" -print -delete
find / -name "*libsolv*" -print -delete
find / -name "*python3.6*" -print -delete
find / -name "*qml*" -print -delete
find / -name "*samba*" -print -delete
find / -name "*gnome*" -print -delete
find / -name "*nm-*" -print -delete
find / -name "*gdm*" -print -delete
find / -name "*ldconfig*" -print -delete
find / -name "*anaconda*" -print -delete
find / -name "*backg*" -print -delete
find / -name "*doc*" -print -delete
find / -name "*gnupg*" -print -delete
find / -name "*help*" -print -delete
find / -name "*ibus*" -print -delete
find / -name "*libthai*" -print -delete
find / -name "*locale*" -print -delete
find / -name "*plymouth*" -print -delete
find / -name "*polkit*" -print -delete
find / -name "*chinese*" -print -delete
find / -name "*japanese*" -print -delete
find / -name "*nese*" -print -delete
find / -name "*games*" -print -delete
find / -name "*rpm*" -print -delete
find / -name "*messages*" -print -delete
find / -name "*mail*" -print -delete
find / -name "*opt*" -print -delete
find / -name "*spool*" -print -delete
find / -name "*player*" -print -delete
find / -name "*zp*" -print -delete
find / -name "*zone*" -print -delete
find / -name "*them*" -print -delete
find / -name "*crack*" -print -delete
find / -name "*iris*" -print -delete
find / -name "*sss*" -print -delete
find / -name "*dnf*" -print -delete
find / -name "*blue*" -print -delete
find / -name "*libgtk*" -print -delete
find / -name "*color*" -print -delete
find / -name "*libquvi*" -print -delete
find / -name "*ldb*" -print -delete
find / -name "*gdb*" -print -delete
find / -name "*gtk*" -print -delete
find / -name "*libmozj*" -print -delete
sh du.bash
