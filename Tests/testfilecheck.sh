#!/bin/sh

# Run more complex tests that check for specific output or error messages.

"$1" -I dts -O dts "$2" 2>&1 | "$3" "${2}"
