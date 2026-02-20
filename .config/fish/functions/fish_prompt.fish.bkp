# 1. Define helper functions first so they are available to the prompt
function flash_fst; set_color -o fa0; end
function flash_snd; set_color -o C00; end
function flash_trd; set_color -o 666; end
function flash_dim; set_color -o 333; end
function flash_off; set_color normal; end

function fish_prompt
    set -l code $status
    set -l prompt $PWD
    set -l base (basename "$prompt")

    # --- Git Logic ---
    set -l git_info ""
    if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
        # Branch Name
        set -l branch (command git branch --show-current)
        test -z "$branch"; and set branch (command git rev-parse --short HEAD)

        # Action State (Rebase/Merge)
        set -l git_dir (command git rev-parse --git-dir)
        set -l action ""
        if test -d "$git_dir/rebase-merge" -o -d "$git_dir/rebase-apply"
            set action "|REBASE"
        else if test -f "$git_dir/MERGE_HEAD"
            set action "|MERGE"
        end

        # Status Symbols
        set -l staged ""; command git diff --cached --quiet; or set staged (flash_fst)"+"
        set -l unstaged ""
        if not command git diff --quiet; or test -n "$(command git ls-files --others --exclude-standard)"
            set unstaged (flash_snd)"*"
        end

        # Ahead/Behind
        set -l ahead_behind ""
        set -l counts (command git rev-list --left-right --count HEAD...@{u} 2>/dev/null)
        if test -n "$counts"
            echo $counts | read -l ahead behind
            test "$ahead" -gt 0; and set ahead_behind "$ahead_behind"(flash_fst)"↑$ahead"
            test "$behind" -gt 0; and set ahead_behind "$ahead_behind"(flash_snd)"↓$behind"
        end

        set git_info (flash_trd)" ($branch$action$staged$unstaged$ahead_behind"(flash_trd)")"(flash_off)
    end

    # --- Path Rendering ---
    # We use (flash_snd) inside the printf to ensure the function is called
    printf "%s" (flash_snd)
    if test "$PWD" = "/"
        if test $code -eq 0; printf "%s" (flash_fst)"/"; else; printf "%s" (flash_dim)"/"; end
    end

    echo "$prompt" \
    | sed "s|$HOME|"(begin
        test $code -eq 0; and echo (flash_fst); or echo (flash_dim)
    end)"~"(flash_off)"|g" \
    | sed "s|/|"(flash_snd)"/"(flash_off)"|g" \
    | sed "s|"$base"|"(flash_fst)$base(flash_off)"|g" | tr -d '\n'

    # Print Git Info
    printf "%s" "$git_info"

    # Closing Bracket
    if test "$PWD" != "/"
        printf "%s" (flash_snd)" >"(flash_off)
    end

    # New line and prompt char
    echo -e "\n> "
end
