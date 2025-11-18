# ============================= #
#        Pumpkane Theme         #
#  Author: ColinZeDev           #
#  Last Edited: 11/17/2025      #
# ============================= #

# Basic colors
typeset -g ORANGE="%F{208}"
typeset -g WHITE="%F{255}"
typeset -g PURPLE="%F{141}"
typeset -g CYAN="%F{38}"
typeset -g YELLOW="%F{214}"
typeset -g GREEN="%F{46}"
typeset -g LIGHTRED="%F{9}"
typeset -g RED="%F{196}"
#typeset -g MAGENTA="%F{201}"
typeset -g BLUE="%F{27}"
typeset -g LIGHTGREEN="%F{82}"
typeset -g RESET="%f"
typeset -g BOLD_RESET="%f%b"

# If CUSTOMUSERNICKNAME exists, show "realname(nick)@host" (this is something I added for myself lol)
if [[ -n "$CUSTOMUSERNICKNAME" ]]; then
    typeset -g USERHOST="${ORANGE}%n${WHITE}(${CYAN}${CUSTOMUSERNICKNAME}${WHITE})@${CYAN}%m${RESET}"
else
    typeset -g USERHOST="${ORANGE}%n${WHITE}@${CYAN}%m${RESET}"
fi

typeset -g PATHPART="${LIGHTGREEN}%~${RESET}"

get_time_color() {
    local hour=$(date +%H)
    if ((hour >= 6 && hour < 12)); then
        echo "$YELLOW"   # morning
    elif ((hour >= 12 && hour < 18)); then
        echo "$LIGHTGREEN"  # afternoon
    else
        echo "$PURPLE"   # evening/night
    fi
}

typeset -g TIME_COLOR=$(get_time_color)
typeset -g TIME="%{$TIME_COLOR%}%*%{$RESET%}"


git_prompt() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        local dirty=""
        local aheadbehind=""

        # dirty status
        if [[ -n $(git status --porcelain) ]]; then
            dirty="${RED}✗${BOLD_RESET}"
        else
            dirty="${GREEN}✔${BOLD_RESET}"
        fi

        # ahead/behind
        local upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
        if [[ -n "$upstream" ]]; then
            local counts=$(git rev-list --left-right --count $upstream...HEAD)
            local behind=${counts%% *}
            local ahead=${counts##* }
            aheadbehind="${YELLOW}"
            [[ $ahead -gt 0 ]] && aheadbehind+="↑$ahead"
            [[ $behind -gt 0 ]] && aheadbehind+="↓$behind"
            aheadbehind+="${BOLD_RESET}"
        fi

        echo "%B${BLUE}@ %B${YELLOW}\ue0a0${BOLD_RESET} ${branch} ${dirty} ${aheadbehind}"
    fi
}

PROMPT="╭─[${USERHOST} ${YELLOW}||${RESET} ${PATHPART}]-[${CYAN}${TIME}${RESET}] \$(git_prompt)
╰─ %B${YELLOW}%%${BOLD_RESET} "