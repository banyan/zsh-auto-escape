declare -ga ZSH_DOLLAR_SIGN_QUOTER_PREFIXES

function autoquote() {
    local prefix_length command args

    for prefix in $ZSH_DOLLAR_SIGN_QUOTER_PREFIXES; do
        # Assume that a prefix is always followed by a space
        prefix_length=$(expr ${#prefix} + 1)
        command=${BUFFER:0:$prefix_length}
        args=${BUFFER:$prefix_length}

        if [[ $command == "$prefix " ]]; then
            for word in ${(ps: :)args}; do
                # 1. if the word contains dollar sign
                # 2. and not escaped like \$
                # 3. and does not contain single quote
                # 4. and does not contain double quote
                if [[ $word =~ "\\$" ]] && ! [[ $word =~ "\\\\" ]] && ! [[ $word =~ "'" ]] && ! [[ $word =~ "\"" ]]; then
                    # Enclose in single quote
                    BUFFER=${BUFFER/${word}/${(qq)${word}}}
                fi
            done
        fi
    done
    zle .accept-line
}

zle -N accept-line autoquote
