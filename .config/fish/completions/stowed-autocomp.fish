function __fish_stow-dotfiles
    set -l commands "stow unstow clean"
    set -l prev (commandline -P -p)
    set -l completions (for c in $commands; echo $c)
    set -l results (string match -f -r "$prev" $completions)
    echo $results
end

complete -f -n "__fish_stow-dotfiles" -a "stow unstow clean" -d "Stow and unstow dotfiles in your home directory." stow-dotfiles
