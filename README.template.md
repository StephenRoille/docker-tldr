![publish image to docker hub](https://github.com/StephenRoille/docker-tldr/actions/workflows/publish-image-and-readme.yml/badge.svg)

# tldr

This is an unofficial image for the [tldr](https://tldr.sh/) project. More specifically it dockerize the [tldr Python client](https://github.com/tldr-pages/tldr-python-client).

The source code is available on GitHub at [stephenroille/docker-tldr](https://github.com/StephenRoille/docker-tldr).

The image is stored on DockerHub at [stephenroille/tldr](https://hub.docker.com/repository/docker/stephenroille/tldr) and is based of the following `Dockerfile`.

```dockerfile

```

## Example: Before Aliasing the `docker container run` Command

Getting help using `mongo`,

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

Notes:

-   `--rm`: remove the container after execution;
-   `-t`: allocate a pseudo-TTY to get a colored output;
-   `-v`: map cache directory (`/root/tldr` in container) to the host machine (`~/.tldr`) to increase the execution speed on subsequent runs.
-   `-e`: overide default environment variables. Refer to the `Dockerfile` for a list available options (e.g. `-e TLDR_LANGUAGE="fr"` to change the language to French).

## Example: After Aliasing the `docker container run` Command

Getting help using `redis-server`,

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

Default behavior when no argument is provided to the `tldr` command (see `CMD = ["--help"]` in `Dockerfile`),

```bash
$ tldr
usage: tldr command [options]

Python command line client for tldr

positional arguments:
  command               command to lookup

optional arguments:
  -h, --help            show this help message and exit
  -v, --version         show program's version number and exit
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
