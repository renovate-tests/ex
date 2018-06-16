defmodule Ex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex,
      version: "0.1.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      preferred_cli_env: [
        "coveralls": :test,
        "coveralls.html": :test,
        "coveralls.json": :test,
      ],
      test_coverage: [tool: ExCoveralls],
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:excoveralls, "~> 0.9.0"},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:credo, "~> 0.7", only: [:dev, :test]},
    ]
  end
end
