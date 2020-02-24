Heavily based on https://github.com/stefanprodan/dockprom

`nodeexporter` collect metrics from host system, such as cpu, memory, network and process load among other things. [Ref](https://github.com/prometheus/node_exporter)

`cadvisor` collect metrics from running containers, similar to `nodeexporter but for each container`. [Ref](https://github.com/google/cadvisor)

`nginxexporter` collect metrics from nginx, such as connections active / request. [Ref](https://github.com/nginxinc/nginx-prometheus-exporter)

`processexporter` collect metrics from select host processes, see which processes is monitored in config file: `exporters/process-exporter.config.yml`. [Ref](https://github.com/ncabatoff/process-exporter)

All of them is running behind nginx.

The metrics will then be collected by `prometheus` and visualized by `grafana`. See `collectors` folder.