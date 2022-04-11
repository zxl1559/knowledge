#!/bin/sh

docker run --name zsxd-docs -d --rm -it -u $(id -u):$(id -g) -v $(pwd):/work -w /work -p 8000:8000 modicn/mkdocs serve-default
