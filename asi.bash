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
