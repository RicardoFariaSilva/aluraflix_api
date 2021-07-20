use Mix.Config

database_url = "#{System.get_env("DATABASE_URL")}#{Mix.env()}"

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :aluraflix_api, AluraflixApi.Repo,
  url: database_url,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :aluraflix_api, AluraflixApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
