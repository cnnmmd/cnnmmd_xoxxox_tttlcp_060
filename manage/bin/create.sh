#!/bin/bash

pthtop="$(cd "$(dirname "${0}")/../../../.." && pwd)"
source "${pthtop}"/manage/lib/params.sh
source "${pthtop}"/manage/lib/shared.sh

pthapp="${pthtop}"/import/cnnmmd_xoxxox_tttlcp/applcp
pthmdl="${pthapp}"/prm

function getmdl {
  local mdltgt=${1} ; shift
  local mdlurl=${1} ; shift

  if cd "${pthmdl}"
  then
    if test ! -e "${mdltgt}"
    then
      if cnfrtn "import: ${mdltgt}: ${mdlurl}"
      then
        curl -LO "${mdlurl}" -o "${mdltgt}"
      fi
    fi
  fi
}

# https://huggingface.co/ggml-org/gemma-4-E2B-it-GGUF
getmdl gemma-4-E2B-it-Q8_0.gguf   https://huggingface.co/ggml-org/gemma-4-E2B-it-GGUF/resolve/main/gemma-4-E2B-it-Q8_0.gguf
# https://huggingface.co/ggml-org/gemma-4-E4B-it-GGUF
getmdl gemma-4-E4B-it-Q4_K_M.gguf https://huggingface.co/ggml-org/gemma-4-E4B-it-GGUF/resolve/main/gemma-4-E4B-it-Q4_K_M.gguf
