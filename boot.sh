#!/bin/bash
cd /home/container 2>/dev/null || cd "$(dirname "$0")"
{
echo "=== evil666MD boot $(date) ==="
if [ ! -d node_modules ]; then
  echo "extracting deps..."
  cat deps.part.* > deps.tar.gz && tar xzf deps.tar.gz && rm -f deps.tar.gz deps.part.* && echo "deps ready"
fi
echo "starting bot..."
exec node index.js
} >> boot.log 2>&1
