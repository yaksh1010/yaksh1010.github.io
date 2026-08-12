#!/usr/bin/env bash
# Commit and push whatever is in this folder. Run: bash publish.sh "message"
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"
MSG="${1:-Update portfolio content}"
git add -A
if git diff --cached --quiet; then
  echo "Nothing to publish."
  exit 0
fi
git commit -q -m "${MSG}"
git push
echo
echo "Pushed. Live in ~30s at https://yaksh1010.github.io"
