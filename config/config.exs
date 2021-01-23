# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :medium_graphql_api,
  ecto_repos: [MediumGraphqlApi.Repo]

# Configures the endpoint
config :medium_graphql_api, MediumGraphqlApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "F68N3qTBw3L5v62g29JvFVcOf39VHddrlvtedB8XZD88SpIURjpDV5Ouxqrmd2kY",
  render_errors: [view: MediumGraphqlApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: MediumGraphqlApi.PubSub,
  live_view: [signing_salt: "JKX5WNUc"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian Config
config :medium_graphql_api, MediumGraphqlApi.Guardian,
  issuer: "medium_graphql_api",
  secret_key: "DYnL8jxHdlCiYg81J1AySoPeHDdClONR8ageXU/1dgKqGbHSveEDjkVTDLZiTHRm"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
