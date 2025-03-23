fish_vi_key_bindings
function fish_user_key_bindings
    bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
    bind -M default q exit
    bind -M default \ca "commandline -f accept-autosuggestion execute"
    bind -M insert \ca "commandline -f accept-autosuggestion execute"
    bind -M insert \cr history-pager
end
