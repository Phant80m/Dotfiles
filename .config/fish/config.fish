if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source


# init cargo and rust
set -gx PATH "$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/" $PATH;
set -gx PATH "$HOME/.cargo/bin" $PATH;
set -gx PATH "$HOME/.local/bin/" $PATH;

# alias
alias ls 'exa --icons -x'
alias icat 'kitty +kitten icat'
alias timg 'timg -p kitty'
alias clean 'echo "This can break things! be warned" && paru -Scc && paru -Qtdq | paru -Rns -'
alias vi-off 'fish_default_key_bindings'
alias vi-on 'fish_vi_key_bindings'
alias str 'df -h | grep "/dev/nvme0n1p2"'
alias code 'cd ~/Documents/code	'
# remove greeting
set -U fish_greeting

#random pokemon
pokemon-colorscripts --random --no-title
