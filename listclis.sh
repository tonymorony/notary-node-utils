#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit

# Optionally just get the cli for a single coin
# e.g "KMD"
specific_coin=$1

komodo_cli="komodo-cli"
chips_cli="chips-cli"
game_cli="gamecredits-cli"
hush3_cli="${komodo_cli} -ac_name=HUSH3"
einsteinium_cli="einsteinium-cli"
gincoin_cli="gincoin-cli"

if [[ -z "${specific_coin}" ]] || [[ "${specific_coin}" = "CHIPS" ]]; then
  echo ${chips_cli}
fi
if [[ -z "${specific_coin}" ]] || [[ "${specific_coin}" = "GAME" ]]; then
  echo ${game_cli}
fi
if [[ -z "${specific_coin}" ]] || [[ "${specific_coin}" = "EMC2" ]]; then
  echo ${einsteinium_cli}
fi
if [[ -z "${specific_coin}" ]] || [[ "${specific_coin}" = "GIN" ]]; then
  echo ${gincoin_cli}
fi
if [[ -z "${specific_coin}" ]] || [[ "${specific_coin}" = "KMD" ]]; then
  echo ${komodo_cli}
fi

