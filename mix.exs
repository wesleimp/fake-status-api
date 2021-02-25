defmodule FakeStatusAPI.MixProject do
  use Mix.Project

  def project do
    [
      app: :fake_status_api,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {FakeStatusAPI.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 4.0"},
      {:plug, "~> 1.11"},
      {:cowboy, "~> 2.8"},
      {:plug_cowboy, "~> 2.0"},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end
end
