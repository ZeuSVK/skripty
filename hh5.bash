cd /boot
wget https://github.com/ZeuSVK/skripty/raw/main/kernel.bash
sed s/\vmlinuz-4.18.0-383.el8.x86_64/vmlinuz-$(uname -r)/ kernel.bash > kernel1.bash
sed s/\initramfs-4.18.0-383.el8.x86_64/initramfs-$(uname -r)/ kernel1.bash > kernel2.bash
sed s/\config-4.18.0-383.el8.x86_64/config-$(uname -r)/ kernel2.bash > kernel3.bash
shopt -s extglob
//sh kernel3.bash
