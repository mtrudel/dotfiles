#!/bin/zsh

command -v brew &> /dev/null && brew install -q ack
command -v brew &> /dev/null && brew install -q colima docker docker-compose docker-buildx
command -v brew &> /dev/null && brew services start colima

command -v brew &> /dev/null && mkdir -p ~/.docker/cli-plugins
command -v brew &> /dev/null && ln -sfn $(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose
command -v brew &> /dev/null && ln -sfn $(brew --prefix)/opt/docker-buildx/bin/docker-buildx ~/.docker/cli-plugins/docker-buildx
