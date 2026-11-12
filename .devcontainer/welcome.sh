#!/usr/bin/env bash
# Prints a short checklist the first time a participant's codespace starts.
set -u
cat <<'EOF'

============================================================
  Rayfin App Labs codespace is ready
------------------------------------------------------------
  Setup checks (Setup section 3.5 in your workshop guide):
    node --version     -> should print v24.x
    Copilot Chat       -> select the Copilot icon at the top
                          and type: Say hello in one line

  Lab 4 starts from:  template/field-services-app
  Please do not push to main; this repository is shared.
============================================================

EOF
node --version || true
exit 0
