# Syntax highlighting colors (Nord)
set --global fish_color_autosuggestion 555 brblack
set --global fish_color_cancel -r
set --global fish_color_command 005fd7
set --global fish_color_comment 990000
set --global fish_color_end 009900
set --global fish_color_error ff0000
set --global fish_color_escape 00a6b2
set --global fish_color_history_current --bold
set --global fish_color_match --background=brblue
set --global fish_color_operator 00a6b2
set --global fish_color_param 00afff
set --global fish_color_quote 999900
set --global fish_color_redirection 00afff
set --global fish_color_search_match bryellow --background=brblack
set --global fish_color_selection white --bold --background=brblack
set --global fish_color_valid_path --underline
set --global fish_pager_color_description B3A06D yellow
set --global fish_pager_color_prefix white --bold --underline
set --global fish_pager_color_progress brwhite --background=cyan
set --global fish_pager_color_selected_background -r

set -Ux EDITOR nvim
set -Ux VISUAL nvim

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
set PATH $PATH $GOBIN

set PATH /opt/homebrew/bin $PATH


export PYENV_ROOT="$HOME/.pyenv"
set PATH $PYENV_ROOT/bin $PATH

# Aliases
if type -q nvim
  alias vi='nvim'
  alias vim='nvim'
  alias vimdiff="nvim -d"
end


alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

starship init fish | source

kitty + complete setup fish | source

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and rbenv init - fish | source
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
