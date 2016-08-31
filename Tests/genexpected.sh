#!/bin/sh

# This script generates the .expected files.  This can be used with an existing
# presumed-good dtc to catch regressions.

for I in *.dts ; do
	$1 -I dts -O dts $I > ${I}.expected
done
