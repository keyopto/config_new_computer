all: bashrc nvim

bashrc:
	cp -i bashrc/* ~/

nvim:
	cp -r -i nvim/* ~/.config/nvim

