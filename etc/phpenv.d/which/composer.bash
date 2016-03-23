#!/bin/false
#
# Summary: phpenv composer plugin
set -e
[ -n "$PHPENV_DEBUG" ] && set -x

if [ "$PHPENV_VERSION" != "system" ]; then
  if [ -x "${PHPENV_ROOT}/versions/${PHPENV_VERSION}/composer/vendor/bin/${PHPENV_COMMAND}" ]; then
    PHPENV_COMMAND_PATH="${PHPENV_ROOT}/versions/${PHPENV_VERSION}/composer/vendor/bin/${PHPENV_COMMAND}"
  elif [ "$PHPENV_COMMAND" == "composer" ]; then
    PHPENV_COMMAND_PATH="${PHPENV_ROOT}/plugins/phpenv-composer/libexec/composer"
  fi
elif [ "$PHPENV_COMMAND" != "composer" ]; then
  composer_cmd=$(PHPENV_VERSION=system phpenv which composer 2>/dev/null ||:)
  if [ -n "$composer_cmd" -a -x "$composer_cmd" ]; then
    composer_home=$("$composer_cmd" config -g home)
    composer_bin_dir=$("$composer_cmd" config -g bin-dir)
    if [ -n "$composer_home" -a -n "$composer_bin_dir" -a -x "$composer_home/$composer_bin_dir/$PHPENV_COMMAND" ]; then
      PHPENV_COMMAND_PATH=$composer_home/$composer_bin_dir/$PHPENV_COMMAND
    fi
  fi
  unset composer_cmd
  unset composer_home
  unset composer_bin_dir
fi
