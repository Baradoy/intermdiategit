# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :intermediate_git,
  ecto_repos: [IntermediateGit.Repo]

# Configures the endpoint
config :intermediate_git, IntermediateGitWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sEHhTMrBcSh5wcY4xytqblVL7GE2rrjsCNtjw7dR6a5+ZaCpADQMt3kGF9Zxzysh",
  render_errors: [view: IntermediateGitWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: IntermediateGit.PubSub,
  live_view: [signing_salt: "mwaZguFW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
