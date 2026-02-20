set -g CMD_DURATION 0

function flash_fst; set_color -o fa0; end      # yellow
function flash_snd; set_color -o C00; end      # red
function flash_trd; set_color -o 666; end      # gray
function flash_dim; set_color -o 333; end
function flash_off; set_color normal; end

function __git_info
    command git rev-parse --is-inside-work-tree >/dev/null 2>&1; or return

    set -l branch (command git symbolic-ref --short HEAD 2>/dev/null; \
                   or command git rev-parse --short HEAD 2>/dev/null)

    set -l flags ""

    # Unstaged changes
    command git diff --no-ext-diff --quiet --ignore-submodules 2>/dev/null
    if test $status -ne 0
        set flags "$flags*"
    end

    # Staged changes
    command git diff --cached --no-ext-diff --quiet --ignore-submodules 2>/dev/null
    if test $status -ne 0
        set flags "$flags+"
    end

    echo "$branch|$flags"
end

function __env_project_name
    if set -q VIRTUAL_ENV
        set -l venv_name (basename "$VIRTUAL_ENV")
        if test "$venv_name" = ".venv"
            echo (basename (dirname "$VIRTUAL_ENV"))
        else
            echo "$venv_name"
        end
    else if set -q CONDA_DEFAULT_ENV
        echo "$CONDA_DEFAULT_ENV"
    end
end

function fish_prompt
    set -l prompt $PWD

    set -l base (basename "$prompt")
    set -l env_name (__env_project_name)   

    set -l branch ""
    set -l flags ""

    set -l git_info (__git_info)
    if test -n "$git_info"
        set branch (string split "|" $git_info)[1]
        set flags (string split "|" $git_info)[2]
    end

    if test -n "$env_name"
        printf (flash_trd)"(%s) "(flash_off) $env_name
    end

    printf (flash_snd)

    echo -n "$prompt" \
        | sed "s|$HOME|~|g" \
        | sed "s|/|"(flash_snd)"/"(flash_off)"|g" \
        | sed "s|"$base"|"(flash_fst)$base(flash_off)"|g"
    
    printf (flash_off)

    if test -n "$branch"
        printf " ("
        printf (flash_trd)"%s"(flash_off) $branch

        if string match -q "*\**" "$flags"
            printf (set_color -o ff4444)"*"
        end

        if string match -q "*+*" "$flags"
            printf (set_color -o ffa500)"+"
        end

        printf (flash_off)")"
    end
    
    echo ""
    printf (flash_snd)"> "(flash_off)
end
