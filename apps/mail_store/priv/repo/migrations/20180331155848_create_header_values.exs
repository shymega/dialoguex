defmodule MailStore.Repo.Migrations.CreateHeaderValues do
  use Ecto.Migration

  def change do
    create table(:header_values) do
      add :value, :string, null: false

      timestamps()
    end

    create index(:header_values, [:value], unique: true)
  end
end
