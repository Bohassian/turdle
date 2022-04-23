# README

* Configuration

This application is intended to run via docker. Install it to your system and then run

```
docker compose build
docker compose up
```

This will set up Ruby and its gems, the postgres database, and start the
webserver. If you'd like to run the services in the background, add `-d`
at the end when you bring up the containers.

If it complains about the `tmp/db` directory (or something else) you may
need to `chown` it to your user so it will have permission.

* Database creation

run this before trying to connect to localhost:3000

```
docker compose exec web db:setup
```

* Database initialization

The initial list of Animals needs to be seeded.

```
docker compose exec web db:seed
```

* Development

Check out <./development.org> for details about how the containers are
set up and how to connect your editor to the solargraph language server
configured for this project.
