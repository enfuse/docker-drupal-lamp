#!/bin/bash
bash stop.sh
docker rm drupal-db;
docker rm drupal-mh;
docker rm drupal-web;

docker rmi drupal-web drupal-db drupal-mh;
