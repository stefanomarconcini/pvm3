
#!/bin/bash
set -e

source "$(dirname "$0")/pvm-env.sh"

if [ -z "$PVM_ARCH" ]; then
    PVM_ARCH="$("$PVM_ROOT/lib/pvmgetarch")"
fi

export PVM_ROOT
export PVM_ARCH
export PATH="$PVM_ROOT/bin/$PVM_ARCH:$PVM_ROOT/lib:$PATH"

echo "Starting PVM cluster using hostfile: $PVM_HOSTFILE"

if [ ! -f "$PVM_HOSTFILE" ]; then
    echo "ERROR: Hostfile not found: $PVM_HOSTFILE"
    exit 1
fi

{
    echo "conf"
    echo "quit"
} | pvm "$PVM_HOSTFILE"

echo "Cluster start complete."