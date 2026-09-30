#!/usr/bin/env bash
# TM Analytics - Finance — local launcher (macOS / Linux)
set -e
cd "$(dirname "$0")"
if [ ! -d .venv ]; then
  echo "Creating virtual environment…"
  python3 -m venv .venv
  ./.venv/bin/pip install --upgrade pip -q
  ./.venv/bin/pip install -r requirements.txt -q
fi
export SECRET_KEY="${SECRET_KEY:-tm-local-dev-key-change-me}"
echo ""
echo "  TM Analytics - Finance is running →  http://localhost:5000"
echo "  (press Ctrl+C to stop)"
echo ""
( sleep 3; (command -v open >/dev/null && open http://localhost:5000) || (command -v xdg-open >/dev/null && xdg-open http://localhost:5000) || true ) &
./.venv/bin/python -m flask --app app run --port 5000
