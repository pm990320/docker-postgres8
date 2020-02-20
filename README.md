Docker Postgres 8
=================

This is a docker image used to run a Postgres version 8 docker image for local testing. Ideally to be used with docker-compose.

This image is not production-ready. It is for local testing purposes only. Use at your own risk.

The initial use case for this was to test connecting to an Amazon AWS Redshift cluster. Redshift runs Postgres version 8.0.2, therefore that is the only one I have supplied an image for.


There are 3 Environment Variables to set:
POSTGRES_USER - the name of the user to use to log into the database
POSTGRES_PASSWORD - the password to use to authenticate with the database
POSTGRES_DATABASE - the name of the database to create and use


Copy this snippet into your docker-compose.yml file:

    db:
      image: pm990320/docker-postgres8:8.0.2
      environment:
        - POSTGRES_USER=docker
        - POSTGRES_PASSWORD=docker
        - POSTGRES_DATABASE=docker
      ports:
        - 5432:5432

Alternatively, run this command to run the container:

    docker run -p 5432:5432 -e POSTGRES_USER=docker -e POSTGRES_PASSWORD=docker -e POSTGRES_DATABASE=docker pm990320/docker-postgres8:8.0.2
