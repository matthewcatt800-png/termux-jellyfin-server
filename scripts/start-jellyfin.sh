#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

if [[ -z "${PREFIX:-}" || ! -x "$PREFIX/bin/jellyfin" ]]; then
  echo "Run this inside Termux after installing the Jellyfin packages." >&2
  exit 1
fi

WEB_DIR="$PREFIX/lib/jellyfin/jellyfin-web"
if [[ ! -d "$WEB_DIR" ]]; then
  echo "Jellyfin web UI not found: $WEB_DIR" >&2
  exit 2
fi

export DOTNET_ROOT="$PREFIX/lib/dotnet"
export DOTNET_ROOT_ARM64="$DOTNET_ROOT"
export PATH="$PREFIX/bin:$PATH"
mkdir -p "$HOME/.local/share/jellyfin" "$HOME/.config/jellyfin" "$HOME/.cache/jellyfin"
mkdir -p "$HOME/jellyfin-media/Movies" "$HOME/jellyfin-media/TV" "$HOME/jellyfin-media/Music"

exec "$PREFIX/bin/jellyfin" \
  --datadir "$HOME/.local/share/jellyfin" \
  --configdir "$HOME/.config/jellyfin" \
  --cachedir "$HOME/.cache/jellyfin" \
  --webdir "$WEB_DIR"
