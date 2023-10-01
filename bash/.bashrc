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
if [[ -f $GITHUB/dotfiles/bash/git-prompt.sh ]]; then
  source $GITHUB/dotfiles/bash/git-prompt.sh
fi
if [[ -f $EXERCISM/shell/exercism_completion.bash ]]; then
  source $EXERCISM/shell/exercism_completion.bash
fi

#======================================================================
# Aliases
#======================================================================
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias vi="vim"
alias rgf="rg --files | rg"
alias fdf="fd --type f"
alias fdd="fd --type d"
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
# fzf related functions
#======================================================================
function fvi {
    vim "$(fzf -m \
        --bind='ctrl-h:reload(fd --hidden)' \
        --bind='ctrl-n:reload(fd)')"
}

function fcode {
    code "$(fzf -m \
        --bind='ctrl-d:reload(fd --type d)' \
        --bind='ctrl-f:reload(fd --type f)' \
        --bind='ctrl-h:reload(fd --hidden)' \
        --bind='ctrl-n:reload(fd)')"
}

function fpvi {
    vim "$(fzf -m --preview='bat --color=always --style=numbers --line-range=:500 {}')"
}

function fpcode {
    code "$(fzf -m --preview='bat --color=always --style=numbers --line-range=:500 {}')"
}

function fkill() {
    local pid
    if [[ "$UID" != "0" ]]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [[ "x$pid" != "x" ]]; then
        echo $pid | xargs kill -${1:-9}
    fi
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

#======================================================================
# Docker related functions
#======================================================================
function docker_prune {
    docker container prune -f
    docker image prune -f
}

#======================================================================
# Update related functions
#======================================================================
function update_go {
    if [[ -d "${GOROOT}" ]]; then
        rm -rf "${GOROOT}"
    fi
    GO_VERSION=$(curl -s https://go.dev/dl/?mode=json | jq -r '.[0].version')
    DOWNLOAD_TEMP_DIR=$(mktemp -d)
    mkdir -p "${DOWNLOAD_TEMP_DIR}"
    curl -L https://go.dev/dl/${GO_VERSION}.linux-amd64.tar.gz --output "${DOWNLOAD_TEMP_DIR}"/go.tar.gz
    mkdir -p "${GOROOT}"
    tar -C "${GOROOT}" -xf "${DOWNLOAD_TEMP_DIR}"/go.tar.gz --strip-components=1
}

function update_bazel {
    BAZEL_DIR="${HOME}"/bazel
    mkdir -p "${BAZEL_DIR}"

    BAZELISK_URL=$(curl -s https://api.github.com/repos/bazelbuild/bazelisk/releases/latest | jq -r '.assets[] | select(.browser_download_url | contains("linux-amd64")) | .browser_download_url')
    curl -L "${BAZELISK_URL}" --output "${BAZEL_DIR}"/bazel
    chmod +x "${BAZEL_DIR}"/bazel

    BUILDIFIER_URL=$(curl -s https://api.github.com/repos/bazelbuild/buildtools/releases/latest | jq -r '.assets[] | select(.browser_download_url | contains("buildifier-linux-amd64")) | .browser_download_url')
    curl -L "${BUILDIFIER_URL}" --output "${BAZEL_DIR}"/buildifier
    chmod +x "${BAZEL_DIR}"/buildifier

    BUILDOZER_URL=$(curl -s https://api.github.com/repos/bazelbuild/buildtools/releases/latest | jq -r '.assets[] | select(.browser_download_url | contains("buildozer-linux-amd64")) | .browser_download_url')
    curl -L "${BUILDOZER_URL}" --output "${BAZEL_DIR}"/buildozer
    chmod +x "${BAZEL_DIR}"/buildozer
}

function update_fzf {
    cd $HOME/.fzf && git pull && ./install --all && cd -
}

function update_jetbrains_toolbox {
    URL=$(curl -s 'https://data.services.jetbrains.com//products/releases?code=TBA&latest=true&type=release' | jq -r '.TBA[0].downloads.linux.link')
    DOWNLOAD_TEMP_DIR=$(mktemp -d)
    mkdir -p "${DOWNLOAD_TEMP_DIR}"
    curl -L "${URL}" --output "${DOWNLOAD_TEMP_DIR}/jetbrains-toolbox.tar.gz"
    TOOLBOX_DIR="${HOME}"/jetbrains-toolbox
    mkdir -p "${TOOLBOX_DIR}"
    tar -C "${TOOLBOX_DIR}" -xf "${DOWNLOAD_TEMP_DIR}/jetbrains-toolbox.tar.gz" --strip-components=1
}

function update_vundle {
    vim +PluginUpdate +qall
    if [[ -d "${HOME}"/.vim/bundle/YouCompleteMe ]]; then
        "${HOME}"/.vim/bundle/YouCompleteMe/install.py
    fi
}

function update_all {
    rustup update
    sdk update && sdk upgrade
    update_vundle
    update_fzf
    update_go
    update_bazel
    update_jetbrains_toolbox
}