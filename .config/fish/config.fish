if status is-interactive
    # Commands to run in interactive sessions can go here
end

# set -x PATH $PATH /usr/local/cuda-12.9
# set -x PATH $PATH /usr/local/cuda-12.9/bin
# set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/cuda-12.9/lib64

# set -x PATH $PATH /usr/local/go/bin


set -gx EDITOR "nvim" # For ranger file manager
set -gx VISUAL "nvim" # For ranger file manager

set -x PATH $PATH /opt/nvim-linux-x86_64/bin
