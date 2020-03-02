# How to encrypt a domain with nginx and certbot, both as docker container

## References
1. [Medium: Nginx and Let’s Encrypt with Docker in Less Than 5 Minutes](https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71)
2. [GitHub Repo from article above](https://github.com/wmnnd/nginx-certbot)

## Steps
0. copy these `nginx` and `certbot` directories
1. create folders `data/certbot/conf` and `data/certbot/www` inside `nginx` compose directory
2. change domain, email, and data_path in `certbot/getcert.sh`
3. change data path in `docker-compose.yml`
4. see `nginx/conf/nginx.conf`, remove / cut https / 443 server block AND the return 301 block inside server 80 block
5. see `certbot/getcert.sh`, change staging to 1 for testing
6. save and run, test if it works
7. change staging to 0 for obtain real certificate
8. rerun `cerbot/getcert.sh`
9. paste / insert again https / 443 server block in `nginx/conf/nginx.conf` AND the return 301 block inside server 80 block
10. stop, remove, and restart nginx container
11. start certbot container with `docker-compose up -d` for auto-renew

Explanation:
- The certificates is obtained by certbot, and saved into the data_path directory.
- This directory will then be mapped inside the `nginx` compose directory.
- Which in turn will be mapped again inside `nginx` container and used to certify the https / ssl configuration
- The certificates will be auto renewed every 12 hours
