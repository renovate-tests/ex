FROM elixir:1.8.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs inotify-tools postgresql-client yarn
RUN mkdir /myapp
WORKDIR /myapp
COPY mix.exs /myapp/mix.exs
COPY mix.lock /myapp/mix.lock
COPY package.json /myapp/package.json
COPY yarn.lock /myapp/yarn.lock
RUN mix local.hex --force
RUN mix local.rebar --force
COPY . /myapp
