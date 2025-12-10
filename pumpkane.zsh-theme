# ============================= #
#        Pumpkane Theme         #
#  Author: ColinZeDev           #
#  Last Edited: 12/10/2025      #
# ============================= #

# --- Palette ---
ORANGE="%F{208}"
GLOW_YELLOW="%F{215}"
AMBER="%F{223}"
WHITE="%F{255}"
PURPLE="%F{135}"
CYAN="%F{81}"
GREEN="%F{150}"
RED="%F{203}"
BLUE="%F{39}"
RESET="%f"
BOLD="%B"
BOLD_RESET="%b%f"

# --- Dynamic time color ---
get_time_color() {
    local hour=$(date +%H)

    if (( hour >= 6 && hour < 12 )); then
        echo "$PURPLE"
    elif (( hour >= 12 && hour < 18 )); then
        echo "$GLOW_YELLOW"
    elif (( hour >= 18 )); then
        echo "$RED"
    else
        echo "$PURPLE"
    fi
}

# --- Virtualenv indicator ---
venv_prompt() {
    [[ -z "$VIRTUAL_ENV" ]] && return
    local name="${VIRTUAL_ENV:t}"
    echo "%{$BOLD%}%{$ORANGE%}(${name})%{$RESET%} "
}

# --- Git info ---
git_prompt() {
    git rev-parse --is-inside-work-tree &>/dev/null || return

    local branch dirty arrows=""
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)

    if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
        dirty="%{$RED%}✗%{$RESET%}"
    else
        dirty="%{$GREEN%}✔%{$RESET%}"
    fi

    local upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
    if [[ -n "$upstream" ]]; then
        local counts behind ahead
        counts=$(git rev-list --left-right --count "$upstream"...HEAD 2>/dev/null)
        behind=${counts%% *}
        ahead=${counts##* }

        [[ $ahead -gt 0 ]] && arrows+="%{$YELLOW%}↑$ahead %{$RESET%}"
        [[ $behind -gt 0 ]] && arrows+="%{$YELLOW%}↓$behind %{$RESET%}"
    fi

    echo "%{$BLUE%}%{$RESET%} ${branch} ${dirty} ${arrows}"
}

# --- Path Parser ---
get_path() {
    local p="$PWD"

    [[ "$p" == "$HOME" ]] && echo "~" || echo "$p"
}

# =============== PROMPT(s) =============== #
PROMPT=$'
╭─[%{$BLUE%}%n%{$WHITE%}@%{$CYAN%}%m%{$RESET%} %{$AMBER%}•%{$RESET%} %{$GREEN%}$(get_path)%{$RESET%}]-[%{$(get_time_color)%}%*%{$RESET%}] $(venv_prompt)$(git_prompt)
╰─ %{$GLOW_YELLOW%}%B%%%b%f '
