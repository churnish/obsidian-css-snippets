#!/bin/bash
# Sync CSS snippets to the standalone GitHub repo and push

SOURCE="$(cd "$(dirname "$0")" && pwd)"
TARGET="$HOME/repos/obsidian-css-snippets"

rsync -av --delete \
  --include="*.css" \
  --include="archive/" \
  --include="archive/*.css" \
  --include="AGENTS.md" \
  --include="CLAUDE.md" \
  --exclude="*" \
  "$SOURCE/" "$TARGET/"

cd "$TARGET"
git add -A
git diff --cached --quiet && echo "Nothing to push." && exit 0
git commit -m "sync"
git push --force origin main
open "https://github.com/churnish/obsidian-css-snippets"
