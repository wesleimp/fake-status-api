use Mix.Config

config :fake_status_api, FakeStatusAPI.Endpoint,
  port: String.to_integer(System.get_env("PORT") || "4000")

import_config "#{Mix.env()}.exs"
