#!/bin/bash
../listcoins.sh | while read coin; do
  ret=$(./calcaddress.sh $1 $coin)
  wif=$(echo $ret | jq -r .wif)
  addr=$(echo $ret | jq -r .coinaddr)
  echo "[$coin] Importing: $addr"
  cli=$(../listclis.sh $coin)
  $cli importprivkey $wif "" false > /dev/null
done


