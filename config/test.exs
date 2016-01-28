use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_commerce, PhoenixCommerce.Endpoint,
  http: [port: 4001],
  server: true

# And we'll tell hound we want to use chromedriver,
# as well as what our app host and port are.
config :hound,
  driver: "chrome_driver",
  app_host: "http://localhost",
  app_port: 4001,
  browser: "chrome"

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_commerce, PhoenixCommerce.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "phoenix_commerce_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
