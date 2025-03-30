function fish_user_key_bindings
    # ctrl-backspace
    bind \cH backward-kill-word

    # ctrl-del
    bind \e\[3\;5~ kill-word

    # copy current command to clipboard
    bind \cg fish_clipboard_copy
end
