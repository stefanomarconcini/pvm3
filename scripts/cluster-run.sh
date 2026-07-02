
#!/bin/bash
set -e

ACTION="$1"
source "$(dirname "$0")/pvm-env.sh"

local_short="$(hostname -s)"
local_full="$(hostname)"

if [ -z "$ACTION" ]; then
    echo "Usage: $0 {status|stop|clean}"
    exit 1
fi

echo "Running cluster action: $ACTION"

for node in "${PVM_NODES[@]}"; do
    [ -z "$node" ] && continue

    echo
    echo "=== $node ==="

    if [ "$node" = "$PVM_LOCAL_NODE" ] || [ "$node" = "$local_short" ] || [ "$node" = "$local_full" ]; then
        bash "$PVM_ROOT/scripts/pvm-local.sh" "$ACTION"
        continue
    fi

    ping -c1 -W1 "$node" >/dev/null 2>&1 || {
        echo "Skipping unreachable node: $node"
        continue
    }

    ssh "$PVM_USER@$node" \
        "export PVM_ROOT='$PVM_ROOT'; bash '$PVM_ROOT/scripts/pvm-local.sh' '$ACTION'" || true
done

echo
echo "Cluster action complete: $ACTION"
