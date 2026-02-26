set local_config ~/.config/fish/config.local.fish
test -r $local_config; and source $local_config
set -e local_config

if not set -q NOTES_PATH
    set -gx NOTES_PATH ~/.notes
end

set -gx LG_CONFIG_FILE "$HOME/.config/lazygit/config.yaml,$HOME/.config/lazygit/theme.yaml"
set -g fish_prompt_pwd_dir_length 0

if status is-interactive

    # Applications
    if command -q go-task
        go-task --completion fish | source
    end

    # Git repositories
    for d in (find ~/Git -type d -name .git)
        set dir (dirname $d)
        set name (basename $dir)
        alias $name "cd $dir" >/dev/null
    end

end

source ~/.config/fish/theme.fish
