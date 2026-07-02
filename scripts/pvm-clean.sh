#!/bin/bash
#
# pvm-clean.sh
# Kill all local PVM daemons and remove stale state.
#

set -e

echo "==========================================="
echo " Cleaning local PVM environment"
echo "==========================================="

# Kill all local PVM-related processes
echo
echo "Killing pvmd and PVM processes..."

pkill -9 -f pvmd      2>/dev/null || true
pkill -9 -f pvmgs     2>/dev/null || true
pkill -9 -f pvm       2>/dev/null || true
pkill -9 -f hello     2>/dev/null || true

sleep 1

# Remove temporary PVM files
echo
echo "Removing temporary files..."

rm -rf /tmp/pvmd.*
rm -rf /tmp/pvm*
rm -rf /var/tmp/pvm*
rm -rf ~/.pvm*
rm -rf ~/.xpvm*

# Show remaining processes
echo
echo "Remaining PVM processes:"

ps -ef | grep -E "pvmd|pvmgs|xpvm" | grep -v grep || \
echo "None."

echo
echo "Done."
