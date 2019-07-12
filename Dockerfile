FROM elixir:1.9.0-alpine
RUN apk add -U --no-cache \
  postgresql-client postgresql-dev \
  nodejs \
  yarn \
  build-base \
  libxml2-dev \
  libxslt-dev \
  tzdata
RUN mkdir /myapp
WORKDIR /myapp
COPY mix.exs /myapp/mix.exs
COPY mix.lock /myapp/mix.lock
COPY package.json /myapp/package.json
COPY yarn.lock /myapp/yarn.lock
RUN mix local.hex --force
RUN mix local.rebar --force
COPY . /myapp
