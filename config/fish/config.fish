set -g theme_color_scheme nord
set -Ux EDITOR nvim
set -Ux VISUAL nvim

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
# export PATH=$PATH:$GOBIN

# Aliases
if type -q nvim
  alias vi='nvim'
  alias vim='nvim'
  alias vimdiff="nvim -d"
end

# Git Aliases
if type -q git
  alias ga='git add .'
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


kitty + complete setup fish | source

