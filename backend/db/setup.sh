#!/bin/bash

set -eu

RAILS_ROOT=$(cd $(dirname $0)/../ && pwd)
DOCKER_COMPOSE_FILE="${RAILS_ROOT}/docker-compose.yml"

function usage() {
  cat <<EOF
Usage:
  bash $0 [command]
Commands:
  init initialize
EOF
}

function init() {
    echo 'test'
}

if [ $# -eq 0 ];then
  usage
  exit 1
fi

$1
