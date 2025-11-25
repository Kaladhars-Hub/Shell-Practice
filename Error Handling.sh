#!/bin/bash

rsync -a /my_data /backup/
if [ $? -ne 0 ]; then
  echo "ERROR: rsync failed!"
  exit 1
fi

# ✅ You check the exit code with $? -ne 0

# ✅ You provide a clear error message

# ✅ You exit with a non-zero status (exit 1) to indicate failure

# ✅ The logic is correct - if rsync fails, show error and stop

#Advanced

set -euo pipefail
# set -e: Exit on error. If any command fails (returns non-zero), the script stops immediately. This saves you from checking $? every time.

# set -u: Exit on unset variable. If you try to use a variable you haven't defined (e.g., echo $non_existant_var), the script stops. This prevents disastrous bugs (like rm -rf /$undefined_path/).

# set -o pipefail: Makes a pipeline (cmd1 | cmd2) fail if any command in it fails, not just the last one.