export PATH=$PATH:/opt/idafree
export VISUAL=nvim

# simplify aliasies for ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# replace commands
alias vim='nvim'

# utils aliases
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# shorten common commands
alias so='source ~/.bashrc'
alias cba='vim ~/.bash_aliases'
alias cbp='vim ~/.bash_projects'

if [ -f ~/.bash_projects ]; then
	. ~/.bash_projects
fi

