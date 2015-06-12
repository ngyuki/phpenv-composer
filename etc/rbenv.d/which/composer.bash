#!/bin/false
#
# Summary: phpenv composer plugin

if [ "$RBENV_VERSION" != "system" ]; then
  if [ -x "${RBENV_ROOT}/versions/${RBENV_VERSION}/composer/vendor/bin/${RBENV_COMMAND}" ]; then
    RBENV_COMMAND_PATH="${RBENV_ROOT}/versions/${RBENV_VERSION}/composer/vendor/bin/${RBENV_COMMAND}"
  elif [ "$RBENV_COMMAND" == "composer" ]; then
    RBENV_COMMAND_PATH="${RBENV_ROOT}/plugins/phpenv-composer/libexec/composer"
  fi
elif [ "$RBENV_COMMAND" != "composer" ]; then
  composer_cmd=$(RBENV_VERSION=system phpenv which composer 2>/dev/null ||:)
  if [ -n "$composer_cmd" -a -x "$composer_cmd" ]; then
    composer_home=$("$composer_cmd" config -g home)
    composer_bin_dir=$("$composer_cmd" config -g bin-dir)
    if [ -n "$composer_home" -a -n "$composer_bin_dir" -a -x "$composer_home/$composer_bin_dir/$RBENV_COMMAND" ]; then
      RBENV_COMMAND_PATH=$composer_home/$composer_bin_dir/$RBENV_COMMAND
    fi
  fi
  unset composer_cmd
  unset composer_home
  unset composer_bin_dir
fi
