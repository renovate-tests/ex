FROM elixir:1.7.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs inotify-tools postgresql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY mix.exs /myapp/mix.exs
COPY mix.lock /myapp/mix.lock
RUN mix deps.get
COPY . /myapp
