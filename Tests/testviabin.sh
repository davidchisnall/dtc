#!/bin/sh

# Test whether dts -> dts conversion gives the same output as dts -> dtb -> dts
# conversion

"$1" -I dts -O dts "$2" > "${2}.fromdts"
"$1" -I dts -O dtb "$2" | "${1}" -I dtb -O dts > "${2}.fromdtb"
diff "${2}.fromdts" "${2}.fromdtb"
DIFF=$?
rm "${2}.fromdts" "${2}.fromdtb"
exit ${DIFF}
