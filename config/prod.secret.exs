use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :jototter, Jototter.Endpoint,
  secret_key_base: "JoiIfSuabpGhhK6+cZmg2OuLKW+4RCQPbh4MC7aBJCoAxNBvLu23RD80zLz8gzNl"

# Configure your database
config :jototter, Jototter.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "jototter_prod",
  pool_size: 15
