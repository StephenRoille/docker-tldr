![publish image to docker hub](https://github.com/StephenRoille/docker-tldr/actions/workflows/publish.yml/badge.svg)

# tldr

This is an unofficial image for the [tldr](https://tldr.sh/) project. More specifically it dockerize the [tldr Python client](https://github.com/tldr-pages/tldr-python-client).

This image can be found on DockerHub at [stephenroille/tldr](https://hub.docker.com/repository/docker/stephenroille/tldr) and is based of the following `Dockerfile`.

```dockerfile
DOCKERFILE_CONTENT
```

## Example

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

## Tip

Create an alias in your **run commands** file (`.bashrc`, `.zshrc`, ...) to easily spin a container, show the docs, and remove the container upon completion.

```bash
alias tldr='docker container run --rm -t -v ~/.tldr:/root/tldr stephenroille/tldr'
```

The volume maps the `/root/tldr` cache directory from the container to `~/.tldr` on your host machine and allows to increase the execution speed on subsequent runs.

## TEST

change 7
