#!/bin/sh

# Simple test: do we get the same output from dts -> dts conversion that we
# expected?

"$1" -I dts -O dts "$2" | diff "${2}.expected" -
