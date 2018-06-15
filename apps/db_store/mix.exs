defmodule DBStore.MixProject do
  use Mix.Project

  @github_url "https://github.com/shymega/dialoguex/apps/db_store"

  def project do
    [
      app: :db_store,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      source_url: @github_url
    ]
  end

  defp description do
    """
    Dialoguex's DBStore app is the backing storage system.
    """
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [
        :logger,
        :ecto,
        :postgrex
      ],
      mod: {DBStore, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 2.2"},
      {:postgrex, "~> 0.13.5"}
    ]
  end
end
