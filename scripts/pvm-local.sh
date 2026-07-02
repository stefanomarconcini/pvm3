#!/bin/bash
set -e

ACTION="$1"

export PVM_ROOT="${PVM_ROOT:-/home/smarconcini/linux/pvm_study/pvm3}"

if [ -z "$PVM_ARCH" ]; then
    PVM_ARCH="$("$PVM_ROOT/lib/pvmgetarch")"
fi

export PVM_ARCH
export PATH="$PVM_ROOT/bin/$PVM_ARCH:$PVM_ROOT/lib:$PATH"

case "$ACTION" in
    status)
        echo "PVM status on $(hostname) arch=$PVM_ARCH"
        ps -ef | grep -E "pvmd|pvmgs|pvm " | grep -v grep || echo "No PVM processes"
        ls -la /tmp | grep pvm || echo "No PVM temp files"
        ;;

    stop)
        echo "Stopping local PVM on $(hostname) arch=$PVM_ARCH"
        pkill -u "$USER" -f pvmd || true
        pkill -u "$USER" -f pvmgs || true
        ;;

    clean)
        echo "Cleaning local PVM on $(hostname) arch=$PVM_ARCH"
        pkill -u "$USER" -f pvmd || true
        pkill -u "$USER" -f pvmgs || true
        pkill -u "$USER" -f "pvm " || true
        rm -rf /tmp/pvm* /tmp/pvmd.* /tmp/pvmtmp*
        echo "Local cleanup complete."
        ;;

    *)
        echo "Usage: $0 {status|stop|clean}"
        exit 1
        ;;
esac