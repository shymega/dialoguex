defmodule DBStore.DB.Repo.Migrations.CreateMailHeaderValues do
  use Ecto.Migration

  def change do
    create table(:header_values) do
      add :header_value, :string, null: false
      add :header_value_hash, :string, size: 512, null: false

      timestamps()
    end

    create unique_index(:header_values, [:header_value, :header_value_hash])
  end
end
