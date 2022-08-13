#!/bin/bash

set -eu

RAILS_ROOT=$(cd $(dirname $0)/../ && pwd)
DOCKER_COMPOSE_FILE="${RAILS_ROOT}/docker-compose.yml"
