# phpenv composer plugin

[![Build Status](https://travis-ci.org/ngyuki/phpenv-composer.svg?branch=master)](https://travis-ci.org/ngyuki/phpenv-composer)

## Install

```console
$ cd ~/.phpenv/plugins
$ git clone https://github.com/ngyuki/phpenv-composer.git
 :
$ phpenv rehash
$ phpenv global 5.5.9
$ composer --version
Download composer.phar ...
#!/usr/bin/env php
All settings correct for using Composer
Downloading...

Composer successfully installed to: /tmp/composer.phar
Use it: php /tmp/composer.phar
Move composer.phar to /home/your/.phpenv/versions/5.5.9/composer
Composer version 714a47ef93d2387b66a6eff2cb9e2191c79b8d6d 2014-02-23 16:15:02
```

## Example

```console
$ composer global require phpunit/phpunit:\*
 :
$ phpenv rehash
$ phpenv which phpunit
/home/your/.phpenv/versions/5.5.9/composer/vendor/bin/phpunit

$ phpunit --version
PHPUnit 3.7.31 by Sebastian Bergmann.
```
