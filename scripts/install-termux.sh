#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

if [[ -z "${PREFIX:-}" || ! -d "$PREFIX" ]]; then
  echo "This script must run inside Termux." >&2
  exit 1
fi

if [[ "$(uname -m)" != "aarch64" ]]; then
  echo "Warning: this project primarily targets ARM64 (aarch64); your architecture is $(uname -m)." >&2
fi

pkg update
for package in jellyfin-server dotnet-runtime-10.0 jellyfin-ffmpeg ffmpeg libskiasharp; do
  if ! pkg search "$package" 2>/dev/null | grep -Fq "$package"; then
    echo "Required package '$package' was not found by pkg search." >&2
    echo "Check your Termux repositories and package names before continuing." >&2
    exit 2
  fi
done

pkg install -y jellyfin-server dotnet-runtime-10.0 jellyfin-ffmpeg ffmpeg libskiasharp
mkdir -p "$HOME/jellyfin-media/Movies" "$HOME/jellyfin-media/TV" "$HOME/jellyfin-media/Music"
mkdir -p "$HOME/.config/jellyfin" "$HOME/.local/share/jellyfin" "$HOME/.cache/jellyfin"

if [[ ! -x "$PREFIX/bin/jellyfin" ]]; then
  echo "Install finished, but the jellyfin executable was not found at $PREFIX/bin/jellyfin." >&2
  exit 3
fi
if [[ ! -d "$PREFIX/lib/jellyfin/jellyfin-web" ]]; then
  echo "Could not find the web UI at $PREFIX/lib/jellyfin/jellyfin-web." >&2
  echo "Inspect the installed package files and adjust scripts/start-jellyfin.sh if the path differs." >&2
  exit 4
fi

echo "Setup complete. Start with: ./scripts/start-jellyfin.sh"
echo "Keep this terminal session open while Jellyfin is running."
