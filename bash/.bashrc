[[ -z "$TMUX" ]] && exec tmux

shopt -s direxpand

#======================================================================
# Export variables
#======================================================================
export VISUAL=vim
export EDITOR=vim
export GIT_PS1_SHOWDIRTYSTATE=yes
export GIT_PS1_SHOWSTASHSTATE=yes
export GIT_PS1_SHOWUNTRACKEDFILES=yes
export GIT_PS1_SHOWCONFLICTSTATE=yes
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_STATESEPARATOR="|"
export GIT_PS1_SHOWCOLORHINTS=yes
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w $(__git_ps1 "(%s)")\$\[\033[00m\] '
export GITHUB=$HOME/github
export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
export GOROOT="$HOME/go"
export GOPATH="$HOME/gopath"
export BAZEL="$HOME/bazel"
export EXERCISM="$HOME/exercism"
export PATH="$HOME/.local/bin:$GOROOT/bin:$GOPATH/bin:$BAZEL:$EXERCISM:$PATH"
export PROJECTS=$HOME/projects

#======================================================================
# Scripts
#======================================================================
source $GITHUB/dotfiles/bash/git-prompt.sh
source $EXERCISM/shell/exercism_completion.bash

#======================================================================
# Aliases
#======================================================================
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias vi="vim"
alias rgf="rg --files | rg"
alias tks="tmux kill-session -a"
alias sbash="source $HOME/.bashrc"
alias vbash="vim $HOME/.bashrc.sh"
alias cdtmp="cd $HOME/tmp"
alias cddownloads="cd $HOME/Downloads"
alias cdgithub="cd $GITHUB"
alias cddotfiles="cd $GITHUB/dotfiles"
alias cdleetcode="cd $GITHUB/leetcode"
alias cdexercism="cd $GITHUB/exercism"
alias cdprojects="cd $PROJECTS"
alias cdintellij="cd $PROJECTS/intellij"
alias cdclion="cd $PROJECTS/clion"

#======================================================================
# Git related functions
#======================================================================
function git_sync_fork {
    BRANCH=main
    if [[ $# -ne 0 ]]; then
        BRANCH=$1
    fi
    git fetch upstream && \
        git checkout "${BRANCH}" && \
        git pull upstream "${BRANCH}" && \
        git push origin "${BRANCH}" && \
        git checkout -
}

#======================================================================
# PostgreSQL related functions
#======================================================================
function postgres_start {
    docker run --rm --name postgres-test -e POSTGRES_PASSWORD=password -d postgres
}
 
function postgres_stop {
    docker stop postgres-test
}
 
function postgres {
    docker run -it --rm --link postgres-test:postgres postgres psql -h postgres -U postgres
}
