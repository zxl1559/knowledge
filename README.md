Edit:

    docker run --rm -u $(id -u):$(id -g) -it -v $(pwd):/work -w /work -p 8000:8000 modicn/mkdocs serve-default

Build:

    docker run --rm -u $(id -u):$(id -g) -it -v $(pwd):/work -w /work modicn/mkdocs build
