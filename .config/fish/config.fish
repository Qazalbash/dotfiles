if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x PATH $PATH /usr/local/cuda-12.9
set -x PATH $PATH /usr/local/cuda-12.9/bin
set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/cuda-12.9/lib64

set -x PATH $PATH /usr/local/go/bin
