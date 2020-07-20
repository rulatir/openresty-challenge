# openresty-challenge

An honest attempt at a Docker image that follows
[Paul Kulchenko's tutorial](http://notebook.kulchenko.com/zerobrane/debugging-openresty-nginx-lua-scripts-with-zerobrane-studio)
to the letter.

To run the container:

```bash
docker-compose up
```

To dump logs (while container is up and running):

```bash
docker-compose exec challenge cat /var/log/nginx/access.log
docker-compose exec challenge cat /var/log/nginx/error.log
```

To run the simple resty-cli test:

```bash
docker-compose exec challenge /usr/local/bin/resty-cli-wrapper.sh /usr/local/openresty/nginx/lua/cli.lua
```
