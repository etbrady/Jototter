# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :jototter,
  ecto_repos: [Jototter.Repo]

# Configures the endpoint
config :jototter, Jototter.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QDywtSPbXDzHWapL/zS2/JcTQiMzhU3iLoFG1f+z3oUN2EpLaHhH+4wNwW2AB6dD",
  render_errors: [view: Jototter.ErrorView, accepts: ~w(json)],
  pubsub: [name: Jototter.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :jototter, Jototter.Guardian,
      verify_module: Guardian.JWT,  # optional
      issuer: "jototter",
      secret_key: "SWhCFKY4h7yny2t3vgEKHY0vAtBjfg7FcZSmqzESLhUwRjReGsVCP8dvWEwESreE"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
