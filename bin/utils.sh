#!/usr/bin/env bash

if [ "${RTX_TRACE-}" = "1" ]; then
  set -x
fi

echoerr() {
  echo "$1" >&2
}

poetry_bin() {
  echo "$RTX_INSTALL_PATH/bin/poetry"
}

poetry_venv() {
  local pyproject
  pyproject="$(eval "echo ${RTX_TOOL_OPTS__PYPROJECT-}")"
  if [ "$pyproject" = "" ]; then
    return
  fi
  if [[ $pyproject != /* ]] && [[ -n ${RTX_PROJECT_ROOT-} ]]; then
    pyproject="${RTX_PROJECT_ROOT-}/$pyproject"
  fi
  if [[ ! -f $pyproject ]]; then
    echoerr "rtx-poetry: No pyproject.toml found. Execute \`poetry init\` to create \`$pyproject\` first."
    return
  fi
  "$(poetry_bin)" env info --path 2>/dev/null
  true
}
