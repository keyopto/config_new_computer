all: install bashrc nvim

install: install_rust

install_rust:
	echo installation of rust
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

install_vim:
	mkdir temp
	cd temp
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod u+x nvim.appimage
	./nvim.appimage --appimage-extract
	sudo mv squashfs-root /
	sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
	cd ..
	rm -rf temp

bashrc:
	cp -i bashrc/. ~/

nvim:
	mkdir -p ~/.config/nvim && cp -r -i nvim/* ~/.config/nvim

