if status is-interactive
    # Commands to run in interactive sessions can go here
end
~/.cargo/bin/zoxide init fish | source
starship init fish | source

# init cargo and rust
set -gx PATH "$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/" $PATH;
set -gx PATH "$HOME/.cargo/bin" $PATH;
set -gx PATH "$HOME/.codon/bin" $PATH;
set -gx PATH "$HOME/go/bin" $PATH;
set -x OPENAI_KEY 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
set -gx PATH "$HOME/.local/bin/" $PATH;
set -x QT_QPA_PLATFORM wayland


# variables
set -fx EDITOR helix
set -gx QT_STYLE_OVERRIDE kvantum
set -gx BAT_THEME Catppuccin-macchiato
set -x STARSHIP_CONFIG ~/.config/starship/starship.toml 

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# alias
alias ls 'exa --icons -x'
alias la 'exa --icons -a'
alias dir 'exa --icons -x'
alias icat 'kitty +kitten icat'
alias timg 'timg -p kitty'
alias clean 'echo "This can break things! be warned" && paru -Scc && paru -Qtdq | paru -Rns -'
alias vi-off 'fish_default_key_bindings'
alias vi-on 'fish_vi_key_bindings'
alias str 'df -h | grep "/dev/nvme0n1p2"'
alias code 'cd ~/Documents/code	'
alias vscode 'code'
alias vsc 'code'
alias web 'cd $HOME/Documents/web'
alias cat 'bat -p'
alias hx 'helix'
alias hx. 'helix .'
alias pkm 'pokemon-colorscripts'
alias cd 'z'
alias please 'sudo -e'
# remove greeting
set -U fish_greeting

#random pokemon
pokemon-colorscripts --random --no-title

function ls
    if count $argv > /dev/null
        if contains -- $argv --tree
            command exa --icons --tree
        else if contains -- $argv -lah
            command exa -lah
        else if contains -- $argv -a
            command exa -a
        else
            set target_file (realpath $argv[1])
            if test -f $target_file
                bat $target_file
            else
                command exa $argv
            end
        end
    else
        command exa --icons -x
    end
end
function pastebin
    set file_path $argv[1]
    set paste_url (curl -s --data-binary @$file_path https://paste.rs/)
    echo $paste_url | wl-copy
    echo "Link copied to clipboard: ' $paste_url '"
end
function battery_health_percentage
    # Get battery information using upower
    set battery_info (upower -i $(upower -e | grep 'BAT') 2>/dev/null)

    # Check if battery_info is empty (no battery found)
    if test -z "$battery_info"
        echo "Battery not found"
        return
    end

    # Extract the design capacity and the last full capacity from battery_info
    set design_capacity (echo "$battery_info" | grep -oP 'energy-full-design:\s*\K\d+')
    set last_full_capacity (echo "$battery_info" | grep -oP 'energy-full:\s*\K\d+')

    if test -z "$design_capacity" -o -z "$last_full_capacity"
        echo "Design or last full capacity not available"
        return
    end

    # Calculate the battery health percentage
    set health_percentage (math "$last_full_capacity / $design_capacity * 100")

    echo "Battery Health: $health_percentage%"
end

