#!/bin/bash
# ~/dotfiles/claude/hooks/notify-tool-complete.sh - Tool completion notifications

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // "Unknown tool"')

case "$TOOL_NAME" in
  Bash)
    COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // ""' | cut -c 1-50)
    MESSAGE="Bash: $COMMAND"
    ;;
  Write|Edit)
    FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // "file"' | xargs basename)
    MESSAGE="$TOOL_NAME: $FILE"
    ;;
  *)
    MESSAGE="$TOOL_NAME completed"
    ;;
esac

terminal-notifier \
  -title "Claude Code" \
  -message "$MESSAGE" \
  -subtitle "Task Complete" \
  -sound "Submarine"

exit 0
