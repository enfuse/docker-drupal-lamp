#!/bin/bash
bash stop.sh
docker rm drupal-db drupal-web;
docker rm drupal-mh drupal-web;
docker rmi drupal-web drupal-db drupal-mh;
