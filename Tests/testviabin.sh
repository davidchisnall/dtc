#!/bin/sh

# Test whether dts -> dts conversion gives the same output as dts -> dtb -> dts
# conversion

# For tests named .at.dts, add -@ to the dtc invocation
AT=
BASE=`basename "$2"`
if [ `basename -s .at.dts "$BASE"` != "$BASE" ] ; then
	AT=-@
fi

"$1" $AT -I dts -O dts "$2" > "${2}.fromdts"
"$1" $AT -I dts -O dtb "$2" | "${1}" -I dtb -O dts > "${2}.fromdtb"
diff "${2}.fromdts" "${2}.fromdtb"
DIFF=$?
rm "${2}.fromdts" "${2}.fromdtb"
exit ${DIFF}
