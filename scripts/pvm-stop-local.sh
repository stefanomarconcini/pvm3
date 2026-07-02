#!/bin/bash
set -e

source "$(dirname "$0")/pvm-env.sh"

echo "Stopping local PVM on $(hostname)..."

pvm <<EOF || true
halt
EOF

pkill -f pvmd  2>/dev/null || true
pkill -f pvmgs 2>/dev/null || true

echo "Local PVM stopped."
