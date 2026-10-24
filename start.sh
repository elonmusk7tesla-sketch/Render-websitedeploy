#!/bin/bash
set -e

PORT="${PORT:-10000}"
CONSOLE_TOKEN="${CONSOLE_TOKEN:-}"

if [ -z "$CONSOLE_TOKEN" ] || [ "$CONSOLE_TOKEN" = "change-me" ] || [ "${#CONSOLE_TOKEN}" -lt 32 ]; then
  echo "ERROR: Set CONSOLE_TOKEN to a random secret of at least 32 characters."
  exit 1
fi

mkdir -p "${CONSOLE_HOME:-/tmp/hypervm}"

exec /opt/venv/bin/uvicorn server:app --host 0.0.0.0 --port "$PORT"
