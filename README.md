
# RPI Teampass v2

Teampass v2.1.27.36 containerized for raspberry pi (1B)

## Build armv6 teampass docker image

- docker build -t teampass:custom .

## Customize installation

- Edit docker-compose.yml environment vars to customize. Edit web port. Edit DB users/passwords

## Run docker compose

- docker compose up -d

