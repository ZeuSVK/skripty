rm -rfv !("grub2"|"vmlinuz-'$(uname -r)'"|"initramfs-'$(uname -r).img'"|"config-'$(uname -r)'"|"loader")
