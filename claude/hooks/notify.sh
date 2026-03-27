#!/bin/bash
# ~/.dotfiles/claude/hooks/notify.sh - General Claude Code notifications

INPUT=$(cat)
MESSAGE=$(echo "$INPUT" | jq -r '.message // "Claude Code notification"')
NOTIFICATION_TYPE=$(echo "$INPUT" | jq -r '.notification_type // "general"')
SUBTITLE=$(echo "$NOTIFICATION_TYPE" | sed 's/_/ /g' | tr '[:lower:]' '[:upper:]')

terminal-notifier \
  -title "Claude Code" \
  -message "$MESSAGE" \
  -subtitle "$SUBTITLE" \
  -sound "Glass" \
  -activate "com.apple.Terminal"

exit 0
