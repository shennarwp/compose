Nginx container that act as reverse proxy balancer in front of all of my containers running on my server.

**Why?**

Because instead of exposing ports from each containers to the outside and remember which port belongs to which service, i'd rather do something like these:

- instead of typing `mydomain.com:9000` for portainer I would rather type `mydomain.com/portainer`.
- instead of typing `mydomain.com:8080` for jenkins I would rather type `mydomain.com/jenkins`, etc you get the idea.

It is easier to remember and looks neater too.

Currently there are 8 containers running behind nginx, see `./conf/nginx.conf`.
I also restrict `nodeexporter` , `cadvisor`, `nginxexporter` , `pushgateway` url and its metrics page, and `prometheus` behind basic access authentication. [Ref](https://www.booleanworld.com/set-basic-http-authentication-nginx/). htpasswd generator [online](https://www.htaccesstools.com/htpasswd-generator/).

Also change `proxy_redirect` line in jenkins block to your own domain.

TODO:

- separate each container server configuration to its own `.conf`
- SSL / https