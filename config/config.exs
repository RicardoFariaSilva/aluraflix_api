# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :aluraflix_api,
  ecto_repos: [AluraflixApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :aluraflix_api, AluraflixApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6l4hDZnpLzbuabS0dHxCa0voFlNiQjURnHbIOaEiEyGigFcsv1IGE9jg09ckDDOh",
  render_errors: [view: AluraflixApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: AluraflixApi.PubSub,
  live_view: [signing_salt: "n7XhqIoT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :aluraflix_api, AluraflixApiWeb.Auth.Guardian,
  issuer: "aluraflix_api",
  secret_key: "hbdwkm2zy3L1iWGxC584suhLLNXdTILt/pX9zZngYMOydpkP4bM3sn0bvEomXcks"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
