complete -c seraphite -n "__fish_use_subcommand" -s s -l shell-completion -r -f -a "{bash	,elvish	,fish	,powershell	,zsh	}"
complete -c seraphite -n "__fish_use_subcommand" -s v -l version
complete -c seraphite -n "__fish_use_subcommand" -s h -l help -d 'Print help'
complete -c seraphite -n "__fish_use_subcommand" -f -a "setup" -d '-> Setup the dotfiles directory'
complete -c seraphite -n "__fish_use_subcommand" -f -a "tether" -d '-> Link dotfiles into the config directory'
complete -c seraphite -n "__fish_use_subcommand" -f -a "untether" -d '-> unink dotfiles from the config directory'
complete -c seraphite -n "__fish_use_subcommand" -f -a "sync" -d '-> install dependencies from dependency file'
complete -c seraphite -n "__fish_use_subcommand" -f -a "enchant" -d '-> sync, tether & run post install script'
complete -c seraphite -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c seraphite -n "__fish_seen_subcommand_from setup" -s h -l help -d 'Print help'
complete -c seraphite -n "__fish_seen_subcommand_from tether" -s d -l dot-dir -d '-> specify your dotfiles repo location, (is a bit broken)' -r
complete -c seraphite -n "__fish_seen_subcommand_from tether" -s c -l config -d '-> specify which config you want to use, inside your dotfile repo' -r
complete -c seraphite -n "__fish_seen_subcommand_from tether" -s h -l help -d 'Print help'
complete -c seraphite -n "__fish_seen_subcommand_from untether" -s h -l help -d 'Print help'
complete -c seraphite -n "__fish_seen_subcommand_from sync" -s y -l no-confirm
complete -c seraphite -n "__fish_seen_subcommand_from sync" -s h -l help -d 'Print help'
complete -c seraphite -n "__fish_seen_subcommand_from enchant" -s s -l shell -d 'choose what shell runs post install script' -r
complete -c seraphite -n "__fish_seen_subcommand_from enchant" -s h -l help -d 'Print help'
complete -c seraphite -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from setup; and not __fish_seen_subcommand_from tether; and not __fish_seen_subcommand_from untether; and not __fish_seen_subcommand_from sync; and not __fish_seen_subcommand_from enchant; and not __fish_seen_subcommand_from help" -f -a "setup" -d '-> Setup the dotfiles directory'
complete -c seraphite -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from setup; and not __fish_seen_subcommand_from tether; and not __fish_seen_subcommand_from untether; and not __fish_seen_subcommand_from sync; and not __fish_seen_subcommand_from enchant; and not __fish_seen_subcommand_from help" -f -a "tether" -d '-> Link dotfiles into the config directory'
complete -c seraphite -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from setup; and not __fish_seen_subcommand_from tether; and not __fish_seen_subcommand_from untether; and not __fish_seen_subcommand_from sync; and not __fish_seen_subcommand_from enchant; and not __fish_seen_subcommand_from help" -f -a "untether" -d '-> unink dotfiles from the config directory'
complete -c seraphite -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from setup; and not __fish_seen_subcommand_from tether; and not __fish_seen_subcommand_from untether; and not __fish_seen_subcommand_from sync; and not __fish_seen_subcommand_from enchant; and not __fish_seen_subcommand_from help" -f -a "sync" -d '-> install dependencies from dependency file'
complete -c seraphite -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from setup; and not __fish_seen_subcommand_from tether; and not __fish_seen_subcommand_from untether; and not __fish_seen_subcommand_from sync; and not __fish_seen_subcommand_from enchant; and not __fish_seen_subcommand_from help" -f -a "enchant" -d '-> sync, tether & run post install script'
complete -c seraphite -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from setup; and not __fish_seen_subcommand_from tether; and not __fish_seen_subcommand_from untether; and not __fish_seen_subcommand_from sync; and not __fish_seen_subcommand_from enchant; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
