# Developing rails applications using docker

## docker-postgresql-dev
Postgresql image for development purposes, based on Alpine Linux. Feel free to modify this file in your real project
or use your own set of Dockerfiles. The purpose of this to provide one Dockerfile for Development and
Production at the start of your project.

# Building

## Building for Dev
As this image should create files on your machine with the same owner as your dev user, you should build it like this:

```bash
docker build . --tag my-postgresql-dev --build-arg uid=${UID}
```

## Building for Production
This container can be an example or the base for production container so it is better to use it in `FROM` directive
of your own dockerfile. But anyway building it's descendants in production mode is as simple as:
```bash
docker build . --tag my-postgresql-prod
```

In order to get access to the shell (suppose in PGDATA dir):
```bash
docker run -it --rm -v $(pwd):/var/lib/postgresql/data:Z my-postgresql-dev /bin/psql
```

