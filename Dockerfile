FROM bitwalker/alpine-elixir-phoenix:1.12

WORKDIR /app

COPY mix.exs .
COPY mix.lock .

RUN mkdir assets

CMD mix deps.get && mix phx.server