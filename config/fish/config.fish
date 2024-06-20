set -g theme_color_scheme nord
set -Ux EDITOR nvim
set -Ux VISUAL nvim

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
set PATH $PATH $GOBIN

set PATH /opt/homebrew/bin $PATH

set PATH /Library/PostgreSQL/9.3/bin $PATH

export PYENV_ROOT="$HOME/.pyenv"
set PATH $PYENV_ROOT/bin $PATH
set PATH $HOME/.poetry/bin $PATH

# Aliases
if type -q nvim
  alias vi='nvim'
  alias vim='nvim'
  alias vimdiff="nvim -d"
end

# Git Aliases
if type -q git
  alias ga='git add'
  alias gap='git add -p'
  alias gb='git branch'
  alias gc='git commit'
  alias gchead='git commit --amend -CHEAD'
  alias gco='git checkout '
  alias gcp='git cherry-pick'
  alias glod='git log --graph --pretty="%Cgreen%h%Creset%Cblue%d%Creset %Cred%an%Creset: %s"'
  alias glot='git log --no-merges --pretty=oneline --pretty="format :%h %s"'
  alias gnap='git add -N . && git add -p'
  alias gp='git push'
  alias gpr='git pull --rebase'
  alias gra='git rebase --abort'
  alias grc='git rebase --continue'
  alias gri='git rebase --interactive'
  alias gst='git status'
  alias reset-authors ='git commit --amend --reset-author -C HEAD'
end

alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

starship init fish | source

kitty + complete setup fish | source

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and rbenv init - fish | source
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
