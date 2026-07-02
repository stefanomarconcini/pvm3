#!/bin/bash
set -e

source "$(dirname "$0")/pvm-env.sh"

echo "Cleaning local PVM on $(hostname)..."

pkill -9 -f pvmd  2>/dev/null || true
pkill -9 -f pvmgs 2>/dev/null || true
pkill -9 -f xpvm  2>/dev/null || true

rm -rf /tmp/pvmd.*
rm -rf /tmp/pvm*
rm -rf /var/tmp/pvm*
rm -rf "$HOME/.pvm"*
rm -rf "$HOME/.xpvm"*

echo "Remaining PVM processes:"
ps -ef | grep -E "pvmd|pvmgs|xpvm" | grep -v grep || echo "None"

echo "Local PVM cleanup complete."
