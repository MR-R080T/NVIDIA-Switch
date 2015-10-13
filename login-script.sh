#!/bin/bash
RED=`echo -e "\e[31m"`
BLUE=`echo -e "\e[34m"`
GREEN=`echo -e "\e[32m"`
CYAN=`echo -e "\e[36m"`
export OS=`lsb_release -si`
export INS_DIR="/home/christian/git/NVIDIA-Switch"
while true; do
echo ""
echo "${CYAN} Welcome to NVIDIA Optimus dual-gpu graphical selection menu"
echo "${CYAN} Please select a GPU to start the X session inside your xinitrc, or stay at terminal"
echo ""
echo "${RED} Nvidia Dedicated GPU (n)"
echo "${BLUE} Intel intergrated graphics (i)"
echo "${GREEN} Stay at tty (t)"
echo "${CYAN} Advancd options (a)"
echo""
read -p "GPU SELECTION (n/i/t/a)?" gpusel
	case $gpusel in
		[nN]* ) $INS_DIR/nvidia-switch;;
		[iI]* ) $INS_DIR/intel-switch;;
		[tT]* ) exit;;
		[aA]* )	while true; do
				clear 
				echo "${CYAN} Welcome to advanced options"
				echo "${CYAN} Helper scripts available are as follows...."
				echo ""
				echo "${RED} Edit NVIDIA xinitrc file (q)"
				echo "${RED} Edit INTEL xinitrc file (w)"
				echo "${BLUE} Edit NVIDIA xorg.conf (a)"
				echo "${BLUE} Edit INTEL xorg.conf (s)"
				echo "${GREEN} Turn Off NVIDIA Card (z)"
				echo "${GREEN} Turn On NVIDIA Card (x)"
				echo "${GREEM} NVIDIA card status (c)"
				echo "${CYAN} Edit nvidia-switch script (n)"
				echo "${CYAN} Edit intel-switch script (i)"
				echo "${RED} Back to previous menu (b)"
				echo ""
				read -p "${CYAN} Advanced Option Selection (q/w/a/s/z/x/c/n/i/b)?" avdopt
			
					case $avdopt in
					 	[qQ]* ) $EDITOR $INS_DIR/xinitrc-nvidia;;
						[wW]* ) $EDITOR $INS_DIR/xinitrc-intel;;
						[aA]* ) $EDITOR $INS_DIR/xorg.conf-nvidia;;
						[sS]* ) $EDITOR $INS_DIR/xorg.conf-intel;;
						[zZ]* ) $INS_DIR/nvidia-off;;
						[xX]* ) $INS_DIR/nvidia-on;;
						[cC]* ) $INS_DIR/nvidia-status;;
						[nN]* ) $EDITOR $INS_DIR/nvidia-switch;;
						[iI]* ) $EDITOR $INS_DIR/intel-switch;;
						[bB]* ) clear && break;;
					esac
			done
	esac
done



