if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/gradf/miniforge3/bin/conda
    eval /home/gradf/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/gradf/miniforge3/etc/fish/conf.d/conda.fish"
        . "/home/gradf/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/gradf/miniforge3/bin" $PATH
    end
end

if test -f "/home/gradf/miniforge3/etc/fish/conf.d/mamba.fish"
    source "/home/gradf/miniforge3/etc/fish/conf.d/mamba.fish"
end
# <<< conda initialize <<<

# neofetch --size 500px --chafa --crop_mode fit --source ~/cat.jpeg
