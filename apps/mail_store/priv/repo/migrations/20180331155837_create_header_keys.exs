defmodule MailStore.Repo.Migrations.CreateHeaderKeys do
  use Ecto.Migration

  def change do
    create table(:header_keys) do
      add :key, :string, null: false

      timestamps()
    end

    create index(:header_keys, [:key], unique: true)
  end
end
