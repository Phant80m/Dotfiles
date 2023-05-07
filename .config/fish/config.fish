if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source


# init cargo and rust
set -gx PATH "$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/" $PATH;
set -gx PATH "$HOME/.cargo/bin" $PATH;
set -gx PATH "$HOME/.local/bin/" $PATH;

# variables
set -fx EDITOR nvim
set -gx QT_STYLE_OVERRIDE kvantum
set -gx BAT_THEME Catppuccin-macchiato
set -x STARSHIP_CONFIG ~/.config/starship/starship.toml 

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# alias
alias ls 'exa --icons -x'
alias icat 'kitty +kitten icat'
alias timg 'timg -p kitty'
alias clean 'echo "This can break things! be warned" && paru -Scc && paru -Qtdq | paru -Rns -'
alias vi-off 'fish_default_key_bindings'
alias vi-on 'fish_vi_key_bindings'
alias str 'df -h | grep "/dev/nvme0n1p2"'
alias code 'cd ~/Documents/code	'
alias cat 'bat'
alias hx 'helix'
alias pacman 'sudo pacman'
# remove greeting
set -U fish_greeting

#random pokemon
pokemon-colorscripts --random --no-title
