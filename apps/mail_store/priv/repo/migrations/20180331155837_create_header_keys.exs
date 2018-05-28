defmodule MailStore.Repo.Migrations.CreateHeaderKeys do
  use Ecto.Migration

  def change do
    create table(:header_keys, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :key, :string, null: false
    end
  end
end
