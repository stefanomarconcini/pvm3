#!/bin/bash

VM=vm1

echo "Syncing sources to $VM..."

rsync -av --delete \
    --exclude='.git/' \
    --exclude='bin/' \
    --exclude='lib/LINUX64/' \
    --exclude='lib/LINUXARM/' \
    --exclude='*.o' \
    --exclude='*.a' \
    --exclude='*.so' \
    --exclude='core*' \
    "$PVM_ROOT/" \
    "smarconcini@$VM:$PVM_ROOT/"

echo
echo "Building on $VM..."

ssh smarconcini@vm1 <<'EOF'
export PVM_ROOT=/home/smarconcini/linux/pvm_study/pvm3
export PVM_ARCH=LINUXARM
export PATH=$PVM_ROOT/bin/$PVM_ARCH:$PVM_ROOT/lib:$PATH

echo "PVM_ARCH=$PVM_ARCH"

cd $PVM_ROOT
make

cd mytests
make clean
make
EOF

echo
echo "Done."