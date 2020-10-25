#!/bin/bash

echo "--- SETTING UP GITLAB_HOME environment variable ----"

export GITLAB_HOME=/srv/gitlab

echo "---REMOVE OLD GITLAB CONTAINER IF EXISTS ----"

docker rm -f gitlab || true


echo "----RUNNING GITLAB DOCKER IMAGE----"

sudo docker run --detach \
  --hostname gitlab.peder.com \
  --publish 1443:443 --publish 180:80 --publish 122:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  gitlab/gitlab-ee:latest

echo "----DONE RUNNING GITLAB DOCKER IMAGE----"