#!/usr/bin/env bash
# Claude Code status line script
# Displays: directory | model | context usage % | estimated cost

input=$(cat)

# Directory: show last 2 path components
cwd=$(echo "$input" | jq -r '.cwd // .workspace.current_dir // ""')
short_dir=$(echo "$cwd" | awk -F'/' '{
  n=NF
  if (n==1) print "/"
  else if (n==2) print "/" $2
  else print $(n-1) "/" $n
}')
# Replace home directory prefix with ~
home="$HOME"
display_dir="${cwd/#$home/\~}"
# Shorten to last 2 parts if more than 2 deep
IFS='/' read -ra parts <<< "${display_dir#\~/}"
count=${#parts[@]}
if [[ "$display_dir" == "~" ]]; then
  display_dir="~"
elif [[ "$display_dir" == "~/"* ]] && (( count > 2 )); then
  display_dir="~/.../${parts[$((count-2))]}/${parts[$((count-1))]}"
fi

# Model
model=$(echo "$input" | jq -r '.model.display_name // .model.id // "unknown model"')

# Context usage
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
if [[ -n "$used_pct" ]]; then
  used_int=$(printf "%.0f" "$used_pct")
  context_str="ctx: ${used_int}%"
  # Color-code context usage
  if (( used_int >= 80 )); then
    context_display="\033[0;31m${context_str}\033[0m"   # red
  elif (( used_int >= 50 )); then
    context_display="\033[0;33m${context_str}\033[0m"   # yellow
  else
    context_display="\033[0;32m${context_str}\033[0m"   # green
  fi
else
  context_display="\033[0;32mctx: --\033[0m"
fi

# Estimated cost (using approximate token pricing for claude-sonnet/opus)
total_in=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
total_out=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')
cache_write=$(echo "$input" | jq -r '.context_window.current_usage.cache_creation_input_tokens // 0')
cache_read=$(echo "$input" | jq -r '.context_window.current_usage.cache_read_input_tokens // 0')

# Sonnet 4 pricing: $3/MTok input, $15/MTok output, $3.75/MTok cache write, $0.30/MTok cache read
cost=$(echo "$total_in $total_out $cache_write $cache_read" | awk '{
  input_cost  = $1 / 1000000 * 3.00
  output_cost = $2 / 1000000 * 15.00
  cache_w     = $3 / 1000000 * 3.75
  cache_r     = $4 / 1000000 * 0.30
  total = input_cost + output_cost + cache_w + cache_r
  printf "$%.4f", total
}')

printf "\033[0;34m%s\033[0m  \033[0;37m%s\033[0m  %b  \033[0;37m%s\033[0m\n" \
  "$display_dir" "$model" "$context_display" "$cost"
