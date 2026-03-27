#!/bin/bash
# ~/dotfiles/claude/hooks/notify-permission.sh - Permission request alerts

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // "Unknown"')
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // ""' | cut -c 1-60)

terminal-notifier \
  -title "Claude Code - Permission Needed" \
  -message "Approve $TOOL_NAME: $COMMAND" \
  -subtitle "Waiting for Input" \
  -sound "Hero" \
  -activate "com.apple.Terminal"

exit 0
