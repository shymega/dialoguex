use Mix.Config

config :mail_store,
  ecto_repos: [
    MailStore.DB.Repo
  ]

config :mail_store, MailStore.DB.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: "localhost",
  database: "mailstore_dev",
  username: "postgres",
  password: "postgres."
