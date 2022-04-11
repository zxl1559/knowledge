#!/bin/sh

set -ex

docker run --rm -u $(id -u):$(id -g) -v $(pwd):/work -w /work modicn/mkdocs build
rsync -az --delete site/ zsxd-hq-srv01:/opt/apps/nginx/sites/vip/
