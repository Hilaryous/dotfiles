set -g theme_color_scheme nord
set -Ux EDITOR nvim
set -Ux VISUAL nvim

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
set PATH $PATH $GOBIN
set PATH /usr/local/bin $PATH
set PATH $PATH /Users/hilarydenton/Library/Python/3.7/bin
set PATH /Library/PostgreSQL/9.3/bin $PATH

# Aliases
if type -q nvim
  alias vi='nvim'
  alias vim='nvim'
  alias vimdiff="nvim -d"
end

# Python Aliases
# alias python=/usr/local/bin/python3
# alias pip=/usr/local/bin/pip3

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


