Based on:
- https://www.innoq.com/de/blog/logging-mit-docker-und-elasticsearch/
- https://github.com/jochenchrist/docker-logging-elasticsearch
- https://github.com/elastic/stack-docker

Centralized containers logging using docker log file collected by `filebeat` and then shipped to elk-stack.

Modifications:
- added `logstash` to act as aggregator before `elasticsearch`

Why not outputting filebeat directly to elasticsearch?
- in a case where maybe I want to add another `filebeat` from another docker host in the future
- end configuration: `filebeat` -> `logstash` -> `elasticsearch` -> `kibana`

How to:
- `docker-compose up`
- configure an index pattern as `logstash-*` and click *Discover*.
- timefilter: `@timestamp`

TODO
- dashboard for kibana
- unify compose style (either with environment or with .env or mapping config file directly)
- elasticsearch security package so that both elasticsearch and kibana have proper credentials
- filtering on logstash