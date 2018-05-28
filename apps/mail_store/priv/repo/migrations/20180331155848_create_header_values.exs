defmodule MailStore.Repo.Migrations.CreateHeaderValues do
  use Ecto.Migration

  def change do
    create table(:header_values, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :value, :string, null: false
    end
  end
end
