#!/bin/sh
set -e

# Add route through router container (at runtime)
ip route add default via router || true

exec flask run --host=0.0.0.0
