#!/bin/bash
# Pull latest sources, rebuild Hugo site, publish to the Apache docroot.
# Intended to run on backup.stattenfield.org (via cron or by hand).

set -euo pipefail

SRC_DIR="${SRC_DIR:-/home/keithstattenfield/src/hastherapturehappened}"
DEST_DIR="${DEST_DIR:-/var/www/hastherapturehappened.com}"
HUGO_BIN="${HUGO_BIN:-/snap/bin/hugo}"
DEPLOY_USER="${DEPLOY_USER:-bench}"
LOCK_FILE="${LOCK_FILE:-/tmp/rebuild-hastherapturehappened.lock}"
LOG_TAG="hastherapturehappened-rebuild"

log() {
  echo "$(date -u +'%Y-%m-%dT%H:%M:%SZ') [$LOG_TAG] $*"
}

exec 9>"$LOCK_FILE"
if ! flock -n 9; then
  log "another rebuild is already running; exiting"
  exit 0
fi

if [[ ! -x "$HUGO_BIN" ]]; then
  log "ERROR: hugo not found at $HUGO_BIN"
  exit 1
fi

if [[ ! -d "$SRC_DIR/.git" ]]; then
  log "ERROR: source checkout missing at $SRC_DIR"
  exit 1
fi

cd "$SRC_DIR"

log "git fetch/pull"
git fetch --prune origin
git checkout -q main
git pull --ff-only origin main

log "hugo build"
rm -rf public
"$HUGO_BIN" --minify

if [[ ! -d public ]]; then
  log "ERROR: hugo did not produce public/"
  exit 1
fi

log "deploy $SRC_DIR/public/ → $DEST_DIR/"
# Docroot is owned by $DEPLOY_USER; use that account for the rsync write.
sudo -u "$DEPLOY_USER" rsync -a --delete \
  --exclude '.well-known' \
  "$SRC_DIR/public/" "$DEST_DIR/"

log "done"
