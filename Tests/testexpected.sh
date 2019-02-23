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
if [ `basename ${2}` == "${DOCOPY_TEST}" ] ; then
	sed "s|TESTDIR|${TESTDIR}|g" ${2} | "$1" $AT -I dts -O dts - | diff "${2}.expected" -
	_exit=$?
else
	echo FAIL!
	"$1" $AT -I dts -O dts "$2" | diff "${2}.expected" -
	_exit=$?
fi

exit $_exit
