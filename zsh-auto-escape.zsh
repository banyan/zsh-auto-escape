declare -ga ZSH_DOLLAR_SIGN_QUOTER_PREFIXES

function autoescape() {
    local prefix_length command args

    for prefix in $ZSH_DOLLAR_SIGN_QUOTER_PREFIXES; do
        # Assume that a prefix is always followed by a space
        prefix_length=$(expr ${#prefix} + 1)
        command=${BUFFER:0:$prefix_length}
        args=${BUFFER:$prefix_length}

        if [[ $command == "$prefix " ]]; then
            for word in ${(ps: :)args}; do
                if ! [[ $word =~ "\\\\" ]]; then # Assuming human never types backslash and treats it's already escaped and does nothing.
                    escaped=$(printf '%q' "$word")
                    BUFFER=${BUFFER/${word}/${escaped}}
                fi
            done
        fi
    done
    zle .accept-line
}

zle -N accept-line autoescape
