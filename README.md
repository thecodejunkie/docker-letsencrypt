# docker-letsencrypt

Dockerfile for issuing Let's Encrypt certificates from inside a container. The container is intended to run as a job and will not keep track of renewals on its own.

## Prerequisites

- [Docker](https://www.docker.com/) installed on your machine

## Environment variables

Name              | Description
------------------|----------------------------------------------------------------------------------------------------------------------
`CERTBOT_DOMAINS` | Comma separated list of domains to issue certificates for. This will be passed to the `certbot` parameter `--domains`
`CERTBOT_EMAIL`   | E-mail address to use when issuing the certificates. This will be passed to the `certbot` parameter `--email`

## Running the container

```
docker build -t docker-letsencrypt .

docker run \
    -it \
    -p 80:80 \
    -e CERTBOT_EMAIL=name@example.com \
    -e CERTBOT_DOMAINS=example.com,www.example.com \
    docker-letsencrypt
```

## Useful container mounts

The following folders can be useful to mount onto your local file system, if you want to keep an eye on what is happening inside the container when it runs.

Name                   | Description
-----------------------|-------------------------------------------------------------------------------------------------------------------------------
`/challenges`          | The folder where `certbot` will store the well known challenge files that is used to verify the legitimacy if the cert request
`/etc/letsencrypt`     | The folder where `certbot` will store the issues certificates
`/var/log/letsencrypt` | The folder where `certbot` will write its log files

For more information, please refer to the Docker documentation on [how to use volumes](https://docs.docker.com/storage/volumes/).
