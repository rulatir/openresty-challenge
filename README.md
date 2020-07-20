# openresty-challenge

An honest attempt at a Docker image that follows
[Paul Kulchenko's tutorial](http://notebook.kulchenko.com/zerobrane/debugging-openresty-nginx-lua-scripts-with-zerobrane-studio)
as closely as possible.

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

## Legal

This Dockerfile pulls some files from the open source
[ZeroBrane Studio](https://github.com/pkulchenko/ZeroBraneStudio) project. I believe that those
files are redistributables, or at least that their use by this compatibility research constitutes
fair use.
