#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

echo "== ElyraOS system/core validation =="

if grep -R --exclude=".clang-format*" "set_elyra_version" -n debuggerd/libdebuggerd/tombstone_proto.cpp >/dev/null; then
  echo "[OK] ElyraOS tombstone proto writer is present"
else
  echo "[WARN] ElyraOS tombstone proto writer was not found"
fi

if grep -R --exclude=".clang-format*" "ElyraOS Version" -n debuggerd/libdebuggerd/tombstone_proto_to_text.cpp >/dev/null; then
  echo "[OK] ElyraOS tombstone text output is present"
else
  echo "[WARN] ElyraOS tombstone text output was not found"
fi

if grep -R --exclude=".clang-format*" "string elyra_version" -n debuggerd/proto/tombstone.proto >/dev/null; then
  echo "[OK] ElyraOS tombstone protobuf field is present"
else
  echo "[WARN] ElyraOS tombstone protobuf field was not found"
fi

echo ""
echo "Remaining LineageOS references are expected in compatibility fields:"
grep -R --exclude=".clang-format*" "LineageOS Version\|lineage_version\|ro.lineage.version" -n debuggerd | sed 's/^/  /' || true
