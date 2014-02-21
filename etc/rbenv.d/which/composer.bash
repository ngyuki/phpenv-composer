#!/bin/false
#
# Summary: phpenv composer plugin

if [ "$RBENV_VERSION" != "system" ]; then
  if [ -x "${RBENV_ROOT}/versions/${RBENV_VERSION}/composer/vendor/bin/${RBENV_COMMAND}" ]; then
    RBENV_COMMAND_PATH="${RBENV_ROOT}/versions/${RBENV_VERSION}/composer/vendor/bin/${RBENV_COMMAND}"
  fi
fi
