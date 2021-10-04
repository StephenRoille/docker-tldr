![publish image to docker hub](https://github.com/StephenRoille/docker-tldr/actions/workflows/publish-image-and-readme.yml/badge.svg)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# tldr

This is an unofficial image for the [tldr](https://tldr.sh/) project. More specifically it dockerizes the [tldr Python client](https://github.com/tldr-pages/tldr-python-client).

![Animation: docker-tldr CLI usage](https://raw.githubusercontent.com/StephenRoille/docker-tldr/master/assets/animation.svg)

The source code is available on GitHub at [stephenroille/docker-tldr](https://github.com/StephenRoille/docker-tldr).

The image is stored on DockerHub at [stephenroille/tldr](https://hub.docker.com/repository/docker/stephenroille/tldr) and is based of the following `Dockerfile`.

```dockerfile
FROM python:alpine

LABEL "org.opencontainers.image.authors"="Stephen Roille"
LABEL "org.opencontainers.image.url"="https://hub.docker.com/r/stephenroille/tldr"
LABEL "org.opencontainers.image.source"="https://github.com/StephenRoille/docker-tldr"
LABEL "org.opencontainers.image.licenses"="GPL-3.0-or-later"
LABEL "org.opencontainers.image.title"="tldr Python client"
LABEL "org.opencontainers.image.description"="Dockerize the tldr Python client, the man pages for fulfilled developers"
LABEL "org.opencontainers.image.base.name"="docker.io/library/python:alpine"


RUN apk update
RUN pip3 install --no-cache tldr

# https://github.com/tldr-pages/tldr-python-client#usage
ENV TLDR_COLOR_NAME="red"
ENV TLDR_COLOR_DESCRIPTION="white"
ENV TLDR_COLOR_EXAMPLE="cyan"
ENV TLDR_COLOR_COMMAND="magenta"
ENV TLDR_COLOR_PARAMETER="white"
ENV TLDR_LANGUAGE="en"
ENV TLDR_CACHE_ENABLED=1
ENV TLDR_CACHE_MAX_AGE=720
ENV TLDR_PAGES_SOURCE_LOCATION="https://raw.githubusercontent.com/tldr-pages/tldr/master/pages"
ENV TLDR_DOWNLOAD_CACHE_LOCATION="https://tldr-pages.github.io/assets/tldr.zip"

ENTRYPOINT [ "tldr" ]
CMD ["--help"]

```

## Example: Before Aliasing the `docker container run` Command

Example getting help with `mongo`,

```bash
$ docker container run --rm -t -v ~/.tldr:/root/tldr stephenroille/tldr mongo

  mongo

  MongoDB interactive shell client.
  More information: https://docs.mongodb.com/manual/reference/program/mongo.

  - Connect to a database:
    mongo database

  - Connect to a database running on a given host on a given port:
    mongo --host host --port port database

  - Connect to a database with a given username; user will be prompted for password:
    mongo --username username database --password

  - Evaluate a JavaScript expression on the database:
    mongo --eval 'JSON.stringify(db.foo.findOne())' database
```

## Tip: Aliasing the `docker container run` Command

Create an alias in your **run commands** file (`.bashrc`, `.zshrc`, ...) to easily spin a container, show the docs, and remove the container upon completion.

```bash
alias tldr='docker container run --rm -t -v ~/.tldr:/root/tldr stephenroille/tldr'
```

**Notes**

-   `--rm`: remove the container after execution;
-   `-t`: allocate a pseudo-TTY to get a colored output;
-   `-v`: map cache directory (`/root/tldr` in container) to the host machine (`~/.tldr`) to increase the execution speed on subsequent runs.
-   `-e`: overide default environment variables. Refer to the `Dockerfile` for a list available options (e.g. `-e TLDR_LANGUAGE="fr"` to change the language to French).

## Example: After Aliasing the `docker container run` Command

Example getting help with `redis-server`,

```bash
$ tldr redis-server

  redis-server

  Persistent key-value database.
  More information: https://redis.io.

  - Start Redis server, using the default port (6379), and write logs to stdout:
    redis-server

  - Start Redis server, using the default port, as a background process:
    redis-server --daemonize yes

  - Start Redis server, using the specified port, as a background process:
    redis-server --port port --daemonize yes

  - Start Redis server with a custom configuration file:
    redis-server path/to/redis.conf

  - Start Redis server with verbose logging:
    redis-server --loglevel warning|notice|verbose|debug
```

Given that `CMD` is set to `["--help"]` in the `Dockerfile`, the `tldr` command prints out help on its usage when no arguments are provided,

```bash
$ tldr
usage: tldr command [options]

Python command line client for tldr

positional arguments:
  command               command to lookup

optional arguments:
  -h, --help            show this help message and exit
  -v, --version         show program\'s version number and exit
  -u, --update_cache    Update the local cache of pages and exit
  -p PLATFORM, --platform PLATFORM
                        Override the operating system [linux, osx, sunos, windows, common]
  -l, --list            List all available commands for operating system
  -s SOURCE, --source SOURCE
                        Override the default page source
  -c, --color           Override color stripping
  -r, --render          Render local markdown files
  -L LANGUAGE, --language LANGUAGE
                        Override the default language
```

## License

This project is distributed under the GNU General Public License Version 3.
