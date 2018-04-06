# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :chatty,
  ecto_repos: [Chatty.Repo]

# Configures the endpoint
config :chatty, ChattyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PV74DvnT9WoKe2/fpVugFHJppgYpErk8AmuKzuSh8TTRPz6HWhy+2yc67FxysUe3",
  render_errors: [view: ChattyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Chatty.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
