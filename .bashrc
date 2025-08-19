ORANGE='\[\033[38;2;255;124;37m\]'
TURQUOISE='\[\033[38;2;21;205;187m\]'
GREEN='\[\033[38;2;0;255;0m\]'
DGREEN='\[\033[38;2;0;150;0m\]'
RED='\[\033[38;2;255;0;0m\]'
DRED='\[\033[38;2;150;0;0m\]'
RESET='\[\033[0m\]'

alias stat="git status"
alias log="git log"
alias push="git push"
alias fpush="git push -u origin"
alias pull="git pull"
alias commit="git commit -m"

if [ -f "/usr/share/git/completion/git-prompt.sh" ]; then
    source "/usr/share/git/completion/git-prompt.sh"
fi

git_prompt_info() {
    local branch=$(__git_ps1 "%s")
    [ -z "$branch" ] && return

    local upstream=""
    local ahead=0
    local behind=0

    local tracking=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
    if [ -n "$tracking" ]; then
        ahead=$(git rev-list --count ${tracking}..HEAD)
        behind=$(git rev-list --count HEAD..${tracking})
    fi

    # Modifs staged / unstaged
    local dirty="${GREEN}✔${TURQUOISE}"
    git diff --quiet --ignore-submodules 2>/dev/null || dirty="${RED}*${TURQUOISE}"

    # Upstream symbol
    if [ "$ahead" -gt 0 ]; then
        upstream+="${DGREEN}↑$ahead${TURQUOISE}"
    fi
    if [ "$behind" -gt 0 ]; then
        [ -n "$upstream" ] && upstream+=" / "
        upstream+="${DRED}↓$behind${TURQUOISE}"
    fi
    [ -z "$upstream" ] && upstream="${GREEN}=${TURQUOISE}"

    default_branch=$(git remote show origin | grep 'HEAD branch' | awk '{print $NF}')
    current_branch=$(git rev-parse --abbrev-ref HEAD)

    if [ "$current_branch" = "$default_branch" ]; then
        local out=" ($branch → $upstream"
        [ -n "$dirty" ] && out+=" / $dirty"
        out+=")"
    else
        local out=" ($branch ↱ $upstream"
        [ -n "$dirty" ] && out+=" / $dirty"
        out+=")"
    fi

    echo "$out"
}

set_bash_prompt() {
    PS1="${ORANGE}\w${TURQUOISE}$(git_prompt_info) ${RESET}> "
}

PROMPT_COMMAND=set_bash_prompt