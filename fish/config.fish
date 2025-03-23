function execute_script
    cd "$(dirname (status --current-filename))"
    ../scripts/$argv[1] $argv[2..]
    cd -
end

function configuration
    execute_script configuration.sh
end

function notes
    execute_script notes.sh
end

function y
    set tmp (mktemp -t 'yazi-cwd.XXXXXX')
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

set local_config ~/.config/fish/config.local.fish
test -r $local_config; and source $local_config
set -e local_config

if status is-interactive
    if not command -q starship
        curl -sS https://starship.rs/install.sh | sh
    end

    set fish_greeting

    # dnf
    alias i='sudo dnf install -y'
    alias r='sudo dnf remove'
    alias s='dnf search'
    alias u='sudo dnf upgrade -y'

    # ls
    if command -q lsd
        alias ls='lsd -g'
    end
    alias l='ls -lh'
    alias la='ls -Alh'
    alias lt='ls --tree'

    # Applications
    alias k='kubectl'
    alias lg='lazygit'
    alias m='multipass'
    alias t='go-task'
    alias tl='t --list'
    alias vim='nvim'

    # Git repositories
    for d in (find ~/Git -type d -name .git)
      set dir (dirname $d)
      set name (basename $dir)
      alias $name "cd $dir" >/dev/null
    end

    # Other aliases
    alias c='configuration'
    alias n='notes'

    starship init fish | source
end
