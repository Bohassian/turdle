# README

Welcome to Turdle,  the game of animal scat identification!

It is also a learning project for Rails 7, Turbo, and Tailwind CSS. We have tried to wrap
the development environment nicely in a container for you, see below.

## Configuration

This application is intended to run via docker. Install it to your system and then run

```sh
docker compose build
docker compose up
```

This will set up Ruby and its gems, the postgres database, and start the
webserver. If you'd like to run the services in the background, add `-d`
at the end when you bring up the containers.

If it complains about the `tmp/db` directory (or something else) you may
need to `chown` it to your user so it will have permission.

## Database creation & initialization

run this before trying to connect to localhost:3000
The initial list of `Animal`s needs to be seeded.

```sh
docker compose exec web rails db:setup
```

# Development

Check out [the development org file](./development.org) for details about
how the containers are set up and how to connect your editor to the solargraph
language server configured for this project.
