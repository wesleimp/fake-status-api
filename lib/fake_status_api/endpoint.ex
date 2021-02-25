defmodule FakeStatusAPI.Endpoint do
  require Logger

  use Plug.Router

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:dispatch)

  forward("/", to: FakeStatusAPI.Router)

  def child_spec(opts) do
    %{id: __MODULE__, start: {__MODULE__, :start_link, [opts]}}
  end

  def start_link(_) do
    with {:ok, [port: port]} <- Application.fetch_env(:fake_status_api, __MODULE__) do
      Logger.info("Starting server at http://localhost:#{port}")
      Plug.Adapters.Cowboy.http(__MODULE__, [])
    end
  end
end
