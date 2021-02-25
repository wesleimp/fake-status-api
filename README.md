# FakeStatusAPI

Simulate several status code responses for your API tests

## References

**Healthcheck**

`/_ah/health`

```sh
$ curl -i http://localhost:4000/_ah/health
HTTP/1.1 200 OK

Health :)
```

**Statuses**

`/api/status/:status`

```sh
$ curl -i http://localhost:4000/api/status/201
HTTP/1.1 201 Created

{"status":201}
```

[Known status codes](https://hexdocs.pm/plug/Plug.Conn.Status.html#code/1-known-status-codes)

## Contributing

Clone this repository anywhere

```sh
git clone git@github.com:wesleimp/fake-status-api.git
```

Install and compile dependencies

```sh
mix do deps.get, deps.compile
```

A good way of making sure everything is all right is running the test suite:

```sh
MIX_ENV=test mix test
```

Running the API locally

```
mix run --no-halt
```