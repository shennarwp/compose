Based on https://github.com/moncho/dry and https://moncho.github.io/dry/

run: `docker-compose run --rm --name dry dry`

`--name` is optional, i just like to tag name on each container

or equivalent `docker run` command (without using this compose file):

```
docker run --rm -ti \
--name=dry \
--volume /var/run/docker.sock:/var/run/docker.sock:ro \
moncho/dry
```