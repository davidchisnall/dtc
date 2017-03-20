#!/bin/sh

# Simple test: do we get the same output from dts -> dts conversion that we
# expected?

# For tests named .at.dts, add -@ to the dtc invocation
AT=
BASE=`basename "$2"`
if [ `basename -s .at.dts "$BASE"` != "$BASE" ] ; then
	AT=-@
fi

"$1" $AT -I dts -O dts "$2" | diff "${2}.expected" -
