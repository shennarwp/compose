Heavily based on https://github.com/stefanprodan/dockprom all credits to them.

Modifications:

- The `exporters` containers are however separated from this stack so it can be deployed on separate system. See `exporter` folder.
- uses `nginx` instead of `caddy` as reverse proxy.
- I don't need `alertmanager` currently so i comment it out on compose file.

Also see file `./config` and change accordingly to set up credentials for grafana.
I also set `GF_AUTH_ANONYMOUS_ENABLED=true` to allow anyone to see without an acount, you might want to set this to false.

Grafana dashboards short explanation (also from [stefanprodan](https://github.com/stefanprodan/dockprom)):

- Docker Host dashboard shows key metrics for monitoring the resource usage of host system.
- Docker Containers dashboard shows key metrics for monitoring running containers.
- Monitor Services dashboard shows key metrics for monitoring the containers that make up the monitoring stack, that is the `exporters` and `collectors`.
- Nginx dashboard shows metrics for the nginx itself.

Additional dashboards:
- pihole dashboard show statistic from pihole
- process explorer dashboard show metrics from select host processes collected by [process-explorer](https://github.com/ncabatoff/process-exporter). See which processes is monitored in config file: `exporters/process-exporter.config.yml`

More detailed description see [stefanprodan explanation](https://github.com/stefanprodan/dockprom#setup-grafana).