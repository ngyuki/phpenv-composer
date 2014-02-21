#!/bin/false
#
# Summary: phpenv composer plugin

cd "$RBENV_ROOT"
make_shims versions/*/composer/vendor/bin/*

#echo "${registered_shims[@]}"

return 0
