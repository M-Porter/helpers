mod install 'justfiles/install.just'

_:
  @just --list

# Adds $HOME/bin to $PATH
setup:
  #!/usr/bin/env bash
  set -euo pipefail
  line='export PATH="$HOME/bin:$PATH"'
  if [ "$(basename "$SHELL")" = "zsh" ]; then
    rc="$HOME/.zshrc"
  elif [ "$(basename "$SHELL")" = "bash" ]; then
    rc="$HOME/.bashrc"
  else
    echo "Error: Could not detect shell (SHELL=$SHELL)" >&2
    exit 1
  fi
  if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
    echo "$HOME/bin already in PATH — no changes made."
    exit 0
  fi
  printf '\n%s\n' "$line" >> "$rc"
  echo "Added to $rc. Run: source $rc"
