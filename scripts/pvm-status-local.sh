#!/bin/bash

source "$(dirname "$0")/pvm-env.sh"

echo "PVM status on $(hostname):"
echo

ps -ef | grep -E "pvmd|pvmgs|xpvm" | grep -v grep || echo "No PVM processes found."

echo
echo "PVM_ROOT=$PVM_ROOT"
echo "PVM_ARCH=$PVM_ARCH"
echo "PATH=$PATH"
