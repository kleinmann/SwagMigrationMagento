#!/usr/bin/env bash

composer dump-autoload
php ../../../dev-ops/analyze/vendor/bin/phpstan analyze --configuration phpstan.neon --autoload-file=../../../vendor/autoload.php src

# Return if phpstan returns with error
if [ $? -eq 1 ]
then
  exit 1
fi

php ../../../dev-ops/analyze/vendor/bin/psalm --config=psalm.xml --threads=$(nproc) --diff --diff-methods --show-info=false
