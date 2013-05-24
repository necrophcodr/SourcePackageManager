#!/bin/bash

[[ "$PAKLIB_ROOT" == "" ]] && export PAKLIB_ROOT=$(pwd -P)/.spm/paklib

for arg in "$@"; do
	[[ "$arg" == "--force-unpack" ]] && force_unpack = true
done

function untar_payload {
	match=$(grep --text --line-number '^PAYLOAD:$' $0 | cut -d ':' -f 1)
	payload_start=$((match + 1))
	tail -n +$payload_start $0 | base64 -d | tar -xjf -
}

if [[ ! -d "${PAKLIB_ROOT}" || "$force_unpack" == "true" ]]; then
	untar_payload
fi
export LUA_PATH=${PAKLIB_ROOT}/?.lua
install -d build/
lua ${PAKLIB_ROOT}/main.lua $@
exit $?
PAYLOAD:
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
