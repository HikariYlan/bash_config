curl -s https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git
ORANGE='\[\033[38;2;255;124;37m\]'
TURQUOISE='\[\033[38;2;21;205;187m\]'
WHITE='\[\033[38;2;252;220;196m\]'
GREEN='\[\033[38;2;0;255;0m\]'
DGREEN='\[\033[38;2;0;150;0m\]'
RED='\[\033[38;2;255;0;0m\]'
DRED='\[\033[38;2;150;0;0m\]'
BLUE='\[\033[38;2;0;123;255m\]'
YELLOW='\[\033[38;2;255;255;0m\]'
RESET='\[\033[0m\]'

alias stat="git status"
alias log="git log"
alias push="git push"
alias fpush="git push -u origin"
alias pull="git pull"
alias commit="git commit -m"
alias commits="git shortlog -n -s"
alias rebase='git checkout main && git pull --rebase && git checkout - && git rebase main'

if [ -f "/usr/share/git/completion/git-prompt.sh" ]; then
    source "/usr/share/git/completion/git-prompt.sh"
fi

git_prompt_info() {
    local branch=$(__git_ps1 "%s")
    [ -z "$branch" ] && return

    local upstream=""
    local ahead=0
    local behind=0

    # Vérifier si la branche upstream existe
    if tracking=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null); then
        ahead=$(git rev-list --count ${tracking}..HEAD 2>/dev/null)
        behind=$(git rev-list --count HEAD..${tracking} 2>/dev/null)

        [ "$ahead" -gt 0 ] && upstream+="${DGREEN}↑$ahead${TURQUOISE}"
        [ "$behind" -gt 0 ] && { [ -n "$upstream" ] && upstream+=" / "; upstream+="${DRED}↓$behind${TURQUOISE}"; }
    fi

    [ -z "$upstream" ] && upstream="${GREEN}=${TURQUOISE}"

    # Vérifier modifs staged / unstaged
    local dirty="${GREEN}✔${TURQUOISE}"
    git diff --quiet --ignore-submodules 2>/dev/null || dirty="${RED}*${TURQUOISE}"

    local current_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    # Récupérer la branche par défaut du remote si possible
    local default_branch
    if git remote get-url origin >/dev/null 2>&1; then
        default_branch=$(git remote show origin | grep 'HEAD branch' | awk '{print $NF}')
    else default_branch="$current_branch"
    fi

    if [ "$current_branch" = "$default_branch" ]; then
        printf " (${WHITE}%s ${BLUE}→${TURQUOISE} %s / %s)" "$branch" "$upstream" "$dirty"
    else
        printf " (${WHITE}%s ${YELLOW}↱${TURQUOISE} %s / %s)" "$branch" "$upstream" "$dirty"
    fi
}

set_bash_prompt() {
    PS1="${ORANGE}\w${TURQUOISE}$(git_prompt_info) ${RESET}> "
}

PROMPT_COMMAND=set_bash_prompt
export PATH="$HOME/bin:$PATH"
source ~/.bash_git
[ -f /etc/bashrc ] && . /etc/bashrc