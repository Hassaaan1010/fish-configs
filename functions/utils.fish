# Function: fcd
# Description: Change directory using fzf and tree
# Usage: fcd [options]
# Options:
#   -p, --plain  Show both columns (pretty tree and full path)
function fcd
    # Determine if plain mode is enabled (-p flag)
    set plain_mode 0
    if test (count $argv) -gt 0
        if test "$argv[1]" = -p
            set plain_mode 1
        end
    end

    if test $plain_mode -eq 1
        # Plain mode: display both columns (pretty tree and full path)
        set selection (
          tree -d -f -I 'node_modules|.git' --noreport |
          sed -E 's/^\.$/.&\t.&/; t; s/^(.*)\.\/(.*\/)?([^/]+)$/\1\3\t.\/\2\3/' |
          fzf --layout=reverse-list --prompt='Select directory> ' --pointer='>' --info=inline
      )
    else
        # Default mode: hide the full path column
        set selection (
          tree -d -f -I 'node_modules|.git' --noreport |
          sed -E 's/^\.$/.&\t.&/; t; s/^(.*)\.\/(.*\/)?([^/]+)$/\1\3\t.\/\2\3/' |
          fzf --layout=reverse-list --prompt='Select directory> ' --pointer='>' --info=inline \
              --delimiter='\t' --with-nth=1 --nth=1
      )
    end

    if test -n "$selection"
        # Extract column 2 (the full path) from the selection
        set path (echo $selection | awk -F'\t' '{print $2}')
        cd "$path"
    end
end
# WORKING tree functionality
# function fcd
#     set selection (
#         tree -d -f -I 'node_modules|.git' --noreport |
#         sed -E 's/^\.$/.\t./; t; s/^(.*)\.\/(.*\/)?([^/]+)$/\1\3\t.\/\2\3/' |
#         fzf --layout=reverse-list \
#             --prompt='Select directory> ' \
#             --pointer='>' \
#             --delimiter='\t' \
#             --with-nth=1 \
#             --nth=1
#     )
#     if test -n "$selection"
#         set path (echo $selection | awk -F'\t' '{print $2}')
#         cd "$path"
#     end
# end
