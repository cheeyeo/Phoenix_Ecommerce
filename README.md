# PhoenixCommerce

To start your Phoenix app:

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


## Integration Tests with Hound

brew install chromedriver

chromedriver --verbose # starts on port 9515 by default

inside config/test.exs


```
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

```
