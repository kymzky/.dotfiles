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

set local_config ~/.config/fish/config.local.fish
test -r $local_config; and source $local_config
set -e local_config
if not set -q NOTES_PATH
    set -gx NOTES_PATH ~/.notes
end

set -gx LG_CONFIG_FILE "$HOME/.config/lazygit/config.yaml,$HOME/.config/lazygit/theme.yaml"
set -g fish_prompt_pwd_dir_length 0

if status is-interactive
    set fish_greeting

    # dnf
    alias u='sudo dnf upgrade -y'

    # git
    alias ga='git add'
    alias gaa='git add --all'
    alias gap='git add --patch'
    alias gb='git branch -vv'
    alias gba='git branch -a -v'
    alias gbd='git branch -d'
    alias gbD='git branch -D'
    alias gc='git checkout'
    alias gC='git checkout -b'
    alias gcm='git commit -m'
    alias gd='git diff'
    alias gds='git diff --staged'
    alias gl='git log --oneline --graph --decorate --all'
    alias gp='git pull'
    alias gP='git push'
    alias gr='git restore'
    alias grp='git restore --patch'
    alias gs='git status --short --branch'
    alias gu='git restore --staged'
    alias gua='git restore --staged -- .'
    alias gup='git restore --staged --patch'

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
    if command -q go-task
        alias task='go-task'
        alias t='task'
        alias tl='t --list'
        task --completion fish | source
    end
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
end
