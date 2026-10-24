#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

if command -v curl >/dev/null 2>&1; then
  if curl --silent --show-error --max-time 3 http://127.0.0.1:8096/health >/dev/null; then
    echo "Jellyfin health endpoint responded on 127.0.0.1:8096."
    exit 0
  fi
fi

if command -v ss >/dev/null 2>&1 && ss -ltn 2>/dev/null | grep -q ':8096'; then
  echo "A process appears to be listening on port 8096, but the health check did not pass."
  exit 1
fi

echo "Jellyfin did not respond on port 8096. Start it with ./scripts/start-jellyfin.sh and check the terminal output." >&2
exit 1
