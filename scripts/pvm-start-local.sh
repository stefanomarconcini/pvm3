#!/bin/bash
set -e

source "$(dirname "$0")/pvm-env.sh"

echo "Starting local PVM on $(hostname)..."

pvm <<EOF
quit
EOF

echo "Local PVM started."
