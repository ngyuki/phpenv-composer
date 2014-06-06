#!/bin/false
#
# Summary: phpenv composer plugin

cd "$RBENV_ROOT"
make_shims composer versions/*/composer/vendor/bin/*

# for system composer
composer_cmd=$(RBENV_VERSION=system phpenv which composer)
if [ -x "$composer_cmd" ]; then
  composer_home=$("$composer_cmd" config -g home)
  composer_bin_dir=$("$composer_cmd" config -g bin-dir)
  if [ -n "$composer_home" -a -n "$composer_bin_dir" -a -d "$composer_home/$composer_bin_dir" ]; then
    make_shims "$composer_home/$composer_bin_dir"/*
  fi
fi
unset composer_cmd
unset composer_home
unset composer_bin_dir
