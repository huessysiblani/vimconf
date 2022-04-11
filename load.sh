#!/bin/bash

if ! [[ "$(pwd)" == *"nvim"* ]]; then
	echo "$0 has to be called from the cloned project's root directory."
	exit 1
fi

echo "Installing dependencies (npm, curl)"
if [[ -x "$(command -v apt)" ]]; then
	echo "Installing npm"
	sudo apt-get install npm
        sudo pacman -S npm
	if ! [[ -x "$(command -v curl)" ]]; then
		echo "Unable to find curl. Installing curl."
		sudo apt-get install curl
                sudo pacman -S curl
	fi

else
	echo "Not installing dependencies. Install manually"
	echo "Dependencies: npm, curl"
fi

if ! [[ -x "$(command -v curl)" ]]; then
	echo "Curl was not properly installed. Ensure curl is installed."
	exit 1
fi

if ! [[ -x "$(command -v npm)" ]]; then
	echo "npm was not properly installed. Ensure npm is installed."
	exit 1
fi


SH_RC_FILE="$HOME/.bashrc"
CREATE_ALIAS=true

if [[ $SHELL == *"zsh"* ]]; then
	SH_RC_FILE="$HOME/.zshrc"
fi

if ! [[ -f "$SH_RC_FILE" ]]; then
	echo "Could not locate bashrc or zshrc. No alias for appimage will be created"
	CREATE_ALIAS=false
fi

nvim_image_link="https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage"
echo "Downloading and storing nvim-appimage at $(pwd)/bin/nvim-appimage"
curl -fLo "$(pwd)/bin/nvim-appimage" "$nvim_image_link"
chmod +x ./bin/nvim-appimage

if [[ "$CREATE_ALIAS" = true ]]; then
	echo "Creating alias for nvim at $SH_RC_FILE"
	echo "alias nvim='$(pwd)/bin/nvim-appimage'" | tee -a "$SH_RC_FILE"
else 
	echo "No alias will be created. nvim appimage location: $(pwd)/bin"
fi

echo "Downloading plug.vim to ./autoload"
plug_link="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
curl -fLo "$(pwd)/autoload/plug.vim" "$plug_link"

echo "Finished downloads."
echo "Restart shell, run nvim and use :PlugInstall"
