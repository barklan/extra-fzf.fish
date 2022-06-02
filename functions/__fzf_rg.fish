function __fzf_rg
    if test -n "$argv[1]"
        cd "$argv[1]"
    end

    set -f RG_DEFAULT_COMMAND "rg -i -l --hidden --no-ignore-vcs"

    set -f selected (
    FZF_DEFAULT_COMMAND="rg --files" fzf \
        -m \
        -e \
        --ansi \
        --disabled \
        --reverse \
        --bind "ctrl-a:select-all" \
        --bind "change:reload:$RG_DEFAULT_COMMAND {q} || true" \
        --preview "rg -i --pretty --context 2 {q} {}" | cut -d":" -f1,2
    )

    if test -n "$selected"
        $EDITOR "$selected"
    end
end
