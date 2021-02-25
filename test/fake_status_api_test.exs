defmodule FakeStatusAPITest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts FakeStatusAPI.Router.init([])

  test "response error when route is not found" do
    assert %{
             status: 404,
             state: :sent,
             resp_body: "Ooops! Something went wrong.\n\nReferences:\n\n==> /api/status/{status}"
           } =
             conn(:get, "/not-found")
             |> FakeStatusAPI.Router.call(@opts)
  end

  test "response the given status" do
    assert %{
             status: 201,
             resp_body: "{\"status\":201}"
           } =
             conn(:get, "/api/status/201")
             |> FakeStatusAPI.Router.call(@opts)
  end

  test "health check" do
    assert %{status: 200, resp_body: "Health :)"} =
             conn(:get, "/_ah/health")
             |> FakeStatusAPI.Router.call(@opts)
  end
end
