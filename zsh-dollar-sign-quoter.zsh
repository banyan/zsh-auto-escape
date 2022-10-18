declare -ga ZSH_DOLLAR_SIGN_QUOTER_PREFIXES

function autoquote() {
    for prefix in $ZSH_DOLLAR_SIGN_QUOTER_PREFIXES; do
        for str ($prefix) {
            if [[ ${(M)BUFFER#$str} ]] {
                for F in ${(ps: :)BUFFER}; do
                    if [[ $F =~ "\\$" ]] && ! [[ $F =~ "'" ]]; then
                        BUFFER=${BUFFER/${F}/${(qq)${F}}}
                    fi
                done
            }
        }
    done
    zle .accept-line
}

zle -N accept-line autoquote
