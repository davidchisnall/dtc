#!/bin/sh

# Simple test: do we get the same output from dts -> dts conversion that we
# expected?

# For tests named .at.dts, add -@ to the dtc invocation
AT=
BASE=`basename "$2"`
if [ `basename -s .at.dts "$BASE"` != "$BASE" ] ; then
	AT=-@
fi

TESTDIR=`dirname "$2"`
DOCOPY_TEST="incbin_absolute.dts"
DOCOPY_FROM=${TESTDIR}/bytes
DOCOPY_TO=/tmp/bsdtc_test_bytes

if [ `basename ${2}` == "${DOCOPY_TEST}" ] ; then
	cp ${DOCOPY_FROM} ${DOCOPY_TO}
fi

"$1" $AT -I dts -O dts "$2" | diff "${2}.expected" -

if [ `basename ${2}` == "${DOCOPY_TEST}" ] ; then
	rm ${DOCOPY_TO}
fi
