use Mix.Config

config :fake_status_api, FakeStatusAPI.Endpoint, port: 4000

import_config "#{Mix.env()}.exs"
