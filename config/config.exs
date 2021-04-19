# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ims,
  ecto_repos: [Ims.Repo]

# Configures the endpoint
config :ims, ImsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6YgJ1QhbV4A0wlmIr3EFNrCWGFcSytAAfS5Xc4yryTaY3hyDML6dEBxbNtgUPOmN",
  render_errors: [view: ImsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Ims.PubSub,
  live_view: [signing_salt: "G3dBomOg"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
