Based on https://github.com/bcicen/ctop https://ctop.sh/

run: `docker-compose run --rm --name ctop ctop`
`--name` is optional, i just like to tag name on each container
or equivalent `docker run` command (without using this compose file):

```
docker run --rm -ti \
--name=ctop \
--volume /var/run/docker.sock:/var/run/docker.sock:ro \
quay.io/vektorlab/ctop:latest
```