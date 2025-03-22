#! /bin/bash

parse_git() {
    local FMT_RESET="\e[0m"
    local FILES_SBG="\e[36m"
    local GIT_DIRTY_SBG="\e[31m"
    local GIT_DIRTY_BG="\e[41m"
    local GIT_CLEAN_SBG="\e[32m"
    local GIT_CLEAN_BG="\e[42m"
    local GIT_FG="\e[30m"

    local STATUS="$(git status -s -b --ahead-behind --porcelain 2> /dev/null)"
    local BRANCH=$(grep -m1 -Po "(?<=## )[\-\w\/]+" <<< "$STATUS")
    local REMOTE=$(grep -m1 -Po "(?<=\\.\\.\\.).+?(?= \\[)" <<< "$STATUS")
    local AHEAD=$(grep -m1 -Po "(?<= \\[ahead )\\d+?(?=\\])" <<< "$STATUS")
    local BEHIND=$(grep -m1 -Po "(?<= \\[behind )\\d+?(?=\\])" <<< "$STATUS")
    local DIRTY=$(grep -m1 -Po "^ \\w .*" <<< "$STATUS")

    if [[ $BRANCH ]]; then
        if [[ $DIRTY ]]; then
            local GIT="${FILES_SBG}${GIT_DIRTY_BG}"
        else
            local GIT="${FILES_SBG}${GIT_CLEAN_BG}"
        fi

        local GIT+=" ${GIT_FG} $BRANCH "

        if [[ $REMOTE ]]; then
            if [[ $AHEAD ]]; then
                local GIT+="+${AHEAD}"
            fi
            if [[ $BEHIND ]]; then
                local GIT+="-${BEHIND}"
            fi

            local GIT+="> ${REMOTE} "
        fi

        if [[ $DIRTY ]]; then
            local GIT_SBG="${GIT_DIRTY_SBG}"
        else
            local GIT_SBG="${GIT_CLEAN_SBG}"
        fi
        
        local GIT+="${FMT_RESET}${GIT_SBG}"

        echo -e "${GIT}"
    else
        echo -e "${FMT_RESET}${FILES_SBG}"
    fi
}

prepare_prompt() {
    local FMT_RESET="\[\e[0m\]"
    local FMT_BOLD="\e[1m"
    local FMT_DIM="\e[2m"
    local FMT_UNBOLD="\e[22m"
    local FMT_UNDIM="\[\e[22m\]"
    local PRIMARY="\[\e[34m\]"
    local PROMPT="\[\e[92m\]"
    local USERNAME_SBG="\[\e[90m\]"
    local USERNAME_BG="\[\e[100m\]"
    local USERNAME_FG="\[\e[97m\]"
    local PATH_SBG="\[\e[34m\]"
    local PATH_BG="\[\e[44m\]"
    local PATH_FG="\[\e[30m\]"
    local FILES_BG="\e[46m"
    local FILES_FG="\e[30m"

    export PS1="\n${PRIMARY}╭─" 
    PS1+="${USERNAME_SBG}"
    PS1+="${USERNAME_BG}${PRIMARY}${FMT_BOLD} @ "
    PS1+="${USERNAME_FG}\u"
    PS1+="${FMT_UNBOLD} ${USERNAME_SBG}${PATH_BG} "
    PS1+="${PATH_FG}\w "
    PS1+="${PATH_SBG}${FILES_BG} "
    PS1+="${FILES_FG}"
    PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type d | wc -l) "
    PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type f | wc -l) "
    PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type l | wc -l) "
    PS1+="${FMT_RESET}${FILES_FBG}"
    PS1+="\$(parse_git)"
    PS1+="\n${FMT_RESET}${PRIMARY}╰ "
    PS1+="${PROMPT}\$${FMT_RESET} "
}

prepare_prompt
