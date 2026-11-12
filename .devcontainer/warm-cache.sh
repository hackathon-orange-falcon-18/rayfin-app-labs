#!/usr/bin/env bash
# Pre-downloads the app template's npm packages into the npm cache during the
# Codespaces prebuild. Lab 4's bootstrap command then installs from the cache
# instead of the internet, which is much faster with 40 people at once.
#
# The install runs in a throwaway copy so no node_modules folder is left inside
# template/field-services-app (the bootstrap command copies that folder).
# Failures are not fatal: the lab still works, just with a slower first install.

set -u
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WARM_DIR="$(mktemp -d)"

echo "Warming npm cache from template/field-services-app ..."
cp "$REPO_ROOT/template/field-services-app/package.json" \
   "$REPO_ROOT/template/field-services-app/package-lock.json" "$WARM_DIR/"

if (cd "$WARM_DIR" && npm ci --ignore-scripts --no-audit --no-fund); then
  echo "npm cache warmed."
else
  echo "WARNING: npm cache warm-up failed. Codespaces will still work; the first install will be slower."
fi

rm -rf "$WARM_DIR"
exit 0
