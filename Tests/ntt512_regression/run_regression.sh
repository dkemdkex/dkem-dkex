#!/usr/bin/env bash
# Build and run the DKEM-512 NTT regression test against one DKEM-512 implementation directory,
# using that directory's own build.sh (with the test program in place of KAT_KEM.c).
#
# usage: bash run_regression.sh <path to a DKEM-512 implementation directory>
#   e.g. bash run_regression.sh ../../DKEM/Implementations/Reference_Implementation/DKEM-512
#        bash run_regression.sh ../../DKEM/Implementations/Optimized_Implementation/DKEM-512
#        bash run_regression.sh ../../DKEM/Implementations/Additional_Implementation/AArch64_NEON/DKEM-512
set -e
[ -f "$1/build.sh" ] || { echo "usage: $0 <DKEM-512 implementation directory>"; exit 2; }
HERE="$(cd "$(dirname "$0")" && pwd)"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
cp -r "$1"/. "$WORK"/
cp "$HERE/regress_ntt512.c" "$WORK/KAT_KEM.c"
cd "$WORK"
sed -i.bak -e '/^\.\/kat_/d' -e '/^echo "KAT/d' build.sh
bash build.sh > build.log 2>&1 || { tail -20 build.log; exit 2; }
./kat_DKEM-512
