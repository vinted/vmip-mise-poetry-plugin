#!/usr/bin/env bash

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
    echoerr "rtx-poetry: no pyproject.toml found at $pyproject"
    exit 1
  fi
  "$(poetry_bin)" env info -p 2>/dev/null
}
