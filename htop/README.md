Based on docker reference: https://docs.docker.com/engine/reference/run/#example-run-htop-inside-a-container

and: https://github.com/ellerbrock/htop-docker and https://hub.docker.com/r/frapsoft/htop/

run: `docker-compose run --rm --name htop htop`

`--name` is optional, i just like to tag name on each container

or equivalent `docker run` command (without using this compose file):

`docker run --rm -it --pid host frapsoft/htop`