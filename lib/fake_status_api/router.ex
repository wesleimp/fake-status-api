defmodule FakeStatusAPI.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  @content_type "application/json"
  get "/" do
    conn
    |> put_resp_content_type(@content_type)
    |> send_resp(:ok, "Welcome to the Fake Status API! :)")
  end

  get "/_ah/health" do
    conn
    |> put_resp_content_type(@content_type)
    |> send_resp(:ok, "Health :)")
  end

  get "/api/status/:status" do
    status = String.to_integer(status)

    conn
    |> put_resp_content_type(@content_type)
    |> send_resp(
      status,
      Poison.encode!(%{
        status: status
      })
    )
  end

  @message "Ooops! Something went wrong.

References:

==> /api/status/{status}"
  match _ do
    send_resp(conn, :not_found, @message)
  end
end
