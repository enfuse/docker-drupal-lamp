#!/bin/bash
FILEPATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)/`basename "${BASH_SOURCE[0]}"`
SCRIPTDIR=`dirname $FILEPATH`

docker build -t drupal-web apache
docker build -t drupal-db mysql
docker build -t drupal-mh mailhog

docker run -p 3306:3306 --name drupal-db -d drupal-db
docker run -p 1025:1025 -p 8025 --name drupal-mh -d drupal-mh
docker run -p 80:80 -v $SCRIPTDIR/www:/var/www/html:rw --link drupal-db:db --link drupal-mh:mh --name drupal-web -d drupal-web
docker exec drupal-web bash /tmp/scripts/drupal-installer.sh
