#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=asia1.ethpool.org:3333
WALLET=0xBC1352cbF81E5C68E46d79f3f6ee0450d4B344F1.lolMinerWorker

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
