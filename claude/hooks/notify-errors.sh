#!/bin/bash
# ~/dotfiles/claude/hooks/notify-errors.sh - Tool failure alerts

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // "Unknown"')
ERROR=$(echo "$INPUT" | jq -r '.error // "Unknown error"' | cut -c 1-80)

terminal-notifier \
  -title "Claude Code Error" \
  -message "$TOOL_NAME failed: $ERROR" \
  -subtitle "Action Required" \
  -sound "Ping"

exit 0
