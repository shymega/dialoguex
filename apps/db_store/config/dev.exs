use Mix.Config

config :db_store,
  ecto_repos: [
    DBStore.DB.Repo
  ]

config :db_store, DBStore.DB.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: "localhost",
  port: 5432,
  database: "dialoguex_dev",
  username: "dialoguex",
  password: "password"
