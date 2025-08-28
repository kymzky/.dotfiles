set -g black 000000
set -g blue 0D8FFF
set -g lightgreen 45D42A
set -g orange FF8800
set -g red B02615
set -g yellow FFE787

set -g fish_color_normal $white
set -g fish_color_command $orange
set -g fish_color_keyword $orange
set -g fish_color_error $red
set -g fish_color_quote $lightgreen
set -g fish_color_redirection $blue
set -g fish_color_param $white
set -g fish_color_comment $black

function fish_mode_prompt
    # hide
end

function fish_prompt
    set_color -o $yellow
    echo -n (prompt_pwd)
    set_color $white
    echo -n (fish_vcs_prompt)
    echo
    set_color $yellow
    echo '$ '
end

function fish_postexec --on-event fish_postexec
    echo
end