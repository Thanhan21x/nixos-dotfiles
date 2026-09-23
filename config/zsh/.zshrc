# main zsh settings. env in ~/.zprofile
# read second

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias cd='z'
# chang niri config
alias cnr='nvim ~/.config/niri/config.kdl'
alias cnix='sudo nvim /etc/nixos/configuration.nix'
alias nrs='sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nhan'


# set up prompt line
source /etc/os-release
NEWLINE=$'\n'
if [[ "$ID" == "nixos" ]]; then
	PROMPT="${NEWLINE}%K{#32302f}%F{#d5c4a1} $0 %K{#3c3836}%F{#d5c4a1} %n %K{#504945} %~ %f%k ❯ " # warmer theme
elif [[ "$ID" == "ubuntu" ]]; then
    PROMPT=$'\n%F{#c0caf5}%K{#1a1b26} ubt %K{#24283b} %~ %K{#1a1b26}%F{#7aa2f7} ❯ %f%k '
else 
    PROMPT="%n@%m:%~%# "
fi


# autosuggestions
# requires zsh-autosuggestions
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then 
	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
	source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# syntax highlighting
#requires zsh-syntax-highlighting package
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source /usr/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

eval "$(zoxide init zsh)"


# Created by `pipx` on 2026-07-16 07:56:40
export PATH="$PATH:/home/iceman/.local/bin"

# ros2
if [ -f /opt/ros/lyrical/setup.zsh ]; then
	source /opt/ros/lyrical/setup.zsh
fi

if [ -f /etc/profile.d/colcon_cd.sh ]; then
	source /etc/profile.d/colcon_cd.sh
fi

export _colcon_cd_root=/opt/ros/lyrical/
