function __execute_script
    cd "$(dirname (status --current-filename))"
    ../../scripts/$argv[1] $argv[2..]
    cd -
end
