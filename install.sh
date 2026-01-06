#!/usr/bin/env bash
set -euo pipefail

# Install HumanLayer Codex skills + command docs into CODEX_HOME
# Defaults to ~/.codex if CODEX_HOME is not set.

CODEX_HOME="${CODEX_HOME:-"$HOME/.codex"}"

echo "Installing HumanLayer Codex skills into: $CODEX_HOME"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$SCRIPT_DIR/skills"
COMMANDS_SRC="$SCRIPT_DIR/commands"

if [ ! -d "$SKILLS_SRC" ]; then
  echo "ERROR: skills/ directory not found next to install.sh" >&2
  exit 1
fi

if [ ! -d "$COMMANDS_SRC" ]; then
  echo "ERROR: commands/ directory not found next to install.sh" >&2
  exit 1
fi

mkdir -p "$CODEX_HOME/skills" "$CODEX_HOME/commands"

echo "Copying skills..."
cp -R "$SKILLS_SRC"/* "$CODEX_HOME/skills/"

echo "Copying command docs..."
cp -R "$COMMANDS_SRC"/* "$CODEX_HOME/commands/"

echo "Done."
echo "Restart Codex to pick up the new skills."
