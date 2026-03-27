#!/bin/bash
# ~/dotfiles/claude/hooks/notify-session-stop.sh - Session stop notifications

INPUT=$(cat)
STOP_HOOK_ACTIVE=$(echo "$INPUT" | jq -r '.stop_hook_active // false')

# Prevent infinite loops
if [ "$STOP_HOOK_ACTIVE" = "true" ]; then
  exit 0
fi

terminal-notifier \
  -title "Claude Code" \
  -message "Claude has finished working" \
  -subtitle "Ready for your input" \
  -sound "Glass" \
  -activate "com.apple.Terminal"

exit 0
