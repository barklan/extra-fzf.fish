function fzf_configure_dunder_bindings --description "Configure fzf functions prefixed with __"
    status is-interactive || test "$CI" = true; or return

    set -q FZF_DEFAULT_OPTS; or set -U FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT"
    set -q FZF_DISABLE_KEYBINDINGS; or set -U FZF_DISABLE_KEYBINDINGS 0
    set -q FZF_PREVIEW_FILE_CMD; or set -U FZF_PREVIEW_FILE_CMD "head -n 10"
    set -q FZF_PREVIEW_DIR_CMD; or set -U FZF_PREVIEW_DIR_CMD ls

    if test "$FZF_DISABLE_KEYBINDINGS" -ne 1
        bind \er __fzf_rg
        bind \eR __fzf_rga

        if ! test "$fish_key_bindings" = fish_default_key_bindings
            bind -M insert \eg __fzf_rg
            bind -M insert \eG __fzf_rga
        end

        if not bind --user \t >/dev/null 2>/dev/null
            if set -q FZF_COMPLETE
                bind \t __fzf_complete
                if ! test "$fish_key_bindings" = fish_default_key_bindings
                    bind -M insert \t __fzf_complete
                end
            end
        end
    end
end
