#if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
#	exec sway
#fi

#if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
#	exec hyprland 
#fi
	
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
