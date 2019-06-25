#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit

if [[ -z $1 ]]; then
    echo "./importwif.sh <passphrase or wif> true/false <coin>"
    echo "eg: ./importwif.sh atestpassphrase true KMD"
    echo "Will import the wif for the passphrase \"atestpassphrase\" with a full rescan"
    echo "The last two arguments are optional. To import all coins with full rescan do:"
    echo "./importwif.sh \"atestpassphrase\""
    exit 0
fi
passphrase=$1

# To import without rescan set $1 to false.
if [[ -z $2 ]]; then
    rescan="true"
else
    rescan=$2
fi

# Optionally count UTXOs for a single coin
specific_coin=$3

../listcoins.sh | while read coin; do
  if [[ -z "${specific_coin}" ]] || [[ "${specific_coin}" = "${coin}" ]]; then
      ret=$(./calcaddress.sh $passphrase $coin)
      wif=$(echo $ret | jq -r .wif)
      addr=$(echo $ret | jq -r .coinaddr)
      echo "[$coin] Importing: $addr"
      cli=$(../listclis.sh $coin)
      $cli importprivkey $wif "" $rescan > /dev/null
  fi
done
