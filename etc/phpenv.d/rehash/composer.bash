#!/bin/false
#
# Summary: phpenv composer plugin
set -e
[ -n "$PHPENV_DEBUG" ] && set -x

cd "$PHPENV_ROOT"
make_shims composer versions/*/composer/vendor/bin/*

# for system composer
composer_cmd=$(RBENV_VERSION=system phpenv which composer 2>/dev/null ||:)
if [ -n "$composer_cmd" -a -x "$composer_cmd" ]; then
  composer_home=$("$composer_cmd" config -g home)
  composer_bin_dir=$("$composer_cmd" config -g bin-dir)
  if [ -n "$composer_home" -a -n "$composer_bin_dir" -a -d "$composer_home/$composer_bin_dir" ]; then
    make_shims "$composer_home/$composer_bin_dir"/*
  fi
fi
unset composer_cmd
unset composer_home
unset composer_bin_dir
