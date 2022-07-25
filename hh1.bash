cd /boot
wget https://github.com/ZeuSVK/skripty/raw/main/kernel.bash
sed s/\4.18.0-383.el8.x86_64/$(uname -r)/ kernel.bash
sed s/\4.18.0-383.el8.x86_64/$(uname -r)/ kernel.bash
sed s/\4.18.0-383.el8.x86_64/$(uname -r)/ kernel.bash
shopt -s extglob
sh kernel.bash
