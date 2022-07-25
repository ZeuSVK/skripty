cd /boot
wget https://github.com/ZeuSVK/skripty/raw/main/kernel.bash
sed s/\vmlinuz-4.18.0-383.el8.x86_64/vmlinuz-$(uname -r)/ kernel.bash
sed s/\initramfs-4.18.0-383.el8.x86_64/initramfs-$(uname -r)/ kernel.bash
sed s/\config-4.18.0-383.el8.x86_64/config-$(uname -r)/ kernel.bash
shopt -s extglob
//sh kernel.bash
