#!/bin/false
#
# Summary: phpenv composer plugin

cd "$RBENV_ROOT"
make_shims composer versions/*/composer/vendor/bin/*
