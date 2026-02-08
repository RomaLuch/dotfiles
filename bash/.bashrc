# export JAVA_HOME=/usr/lib/jvm/java-25-openjdk
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$JAVA_HOME/bin:$PATH

export JDTLS_HOME=~/opt/jdtls/

export PATH=$PATH:$HOME/go/bin

alias hypr=start-hyprland


# opencode
export PATH=/home/roma/.opencode/bin:$PATH

# Для корректной работы Java-окон в Hyprland
export _JAVA_AWT_WM_NONREPARENTING=1
# Заставляет Java использовать GTK-тему (чтобы не было белых рамок)
export JAVA_FONTS=/usr/share/fonts/noto
