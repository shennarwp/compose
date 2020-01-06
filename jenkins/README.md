Custom Jenkins image as container.

In order to Jenkins to be able to call / run another container in the host system, a docker runtime is installed on top of jenkins itself **AND** `/var/run/docker.sock` from host system is mapped to container.

See `Dockerfile` and `docker-compose.yml`

Be wary though as I am still not sure whether this practice is even safe as Jenkins can call / execute any docker command, such as download any unsafe image, mount any volume, etc.