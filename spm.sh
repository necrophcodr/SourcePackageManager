#!/bin/bash

[[ "$PAKLIB_ROOT" == "" ]] && export PAKLIB_ROOT=$(pwd -P)/.spm/paklib

function untar_payload {
	match=$(grep --text --line-number '^PAYLOAD:$' $0 | cut -d ':' -f 1)
	payload_start=$((match + 1))
	tail -n +$payload_start $0 | base64 -d | tar -xjf -
}

if [[ ! -d "${PAKLIB_ROOT}" ]]; then
	untar_payload
fi
export LUA_PATH=${PAKLIB_ROOT}/?.lua
lua ${PAKLIB_ROOT}/main.lua $@
exit $?
PAYLOAD:
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
iEhEsAX0QP+LuSKcKEhbo/DwAA==