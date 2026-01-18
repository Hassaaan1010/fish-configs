
# Add gvm go
bass source ~/.gvm/scripts/gvm ';' gvm use go1.24.5 --default
#set -gx GOROOT $HOME/.gvm/gos/go1.24.5
#set -gx GOPATH $HOME/.gvm/pkgsets/go1.24.5/global
#set -gx PATH $GOROOT/bin $GOPATH/bin $PATH


if status is-interactive
    # Commands to run in interactive sessions can go here
end



# Helper function: shorten all directories except the last to their first two letters.
function shorten_path --description 'Shorten directories except the last'
    # $argv[1] is the full path (expected to be absolute)
    set -l path $argv[1]
    # Remove the leading slash for easier processing
    if test (string sub -l 1 $path) = /
        set path (string sub -s 2 $path)
    end
    set -l parts (string split "/" $path)
    set -l count (count $parts)
    set -l new_parts
    for i in (seq (count $parts))
        if test $i -lt $count
            # Shorten to first 2 characters
            set new_parts $new_parts (string sub -l 2 $parts[$i])
        else
            # Keep the last folder unchanged
            set new_parts $new_parts $parts[$i]
        end
    end
    # Reassemble the path with a leading slash.
    echo "/"(string join "/" $new_parts)
end

# Custom fish_prompt function.
function fish_prompt
    # Leave a line
    # neofetch
    echo ""

    # Shortened current working directory
    set cwd (shorten_path $PWD)

    # Determine the active environment name (from VIRTUAL_ENV or CONDA_DEFAULT_ENV)
    set env_name ""
    if set -q VIRTUAL_ENV
        set env_name (basename $VIRTUAL_ENV)
    end

    # Get the current Git branch if in a repo
    set git_branch ""
    if type -q git
        if git rev-parse --is-inside-work-tree >/dev/null 2>&1
            set git_branch (git rev-parse --abbrev-ref HEAD 2> /dev/null)
        end
    end

    # Build the prompt line with colors
    set prompt_line (set_color cyan)$cwd(set_color normal)
    if test -n "$env_name"
        set prompt_line "$prompt_line "(set_color white)"($env_name)"(set_color normal)
    end
    set prompt_line "$prompt_line "(set_color magenta)"hzn"(set_color normal)
    if test -n "$git_branch"
        set prompt_line "$prompt_line "(set_color yellow)"($git_branch)"(set_color normal)
    end

    # Print the prompt: first line with details, second line with the prompt symbol
    echo $prompt_line
    echo (set_color magenta)"⋊⫸  "(set_color normal)
end



# source aliases file
if test -f ~/.config/fish/aliases.fish
    source ~/.config/fish/aliases.fish
end

if test -f ~/.config/fish/functions/utils.fish
    source ~/.config/fish/functions/utils.fish
end

# Ensure essential system paths are present
set -gx PATH /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin $PATH

# pyenv setup for Fish
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH

# Add Bun
set -gx PATH $HOME/.bun/bin $PATH


# Only if pyenv command exists, initialize it:
if type -q pyenv
    status --is-interactive; and pyenv init - fish | source
    status --is-interactive; and pyenv virtualenv-init - fish | source
end
set -gx GOPATH $HOME/go; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g


#HELIX
export HELIX_RUNTIME=/usr/local/share/helix/runtime
