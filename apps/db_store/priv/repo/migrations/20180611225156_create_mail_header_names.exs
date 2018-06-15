defmodule DBStore.DB.Repo.Migrations.CreateMailHeaderNames do
  use Ecto.Migration

  def change do
    create table(:header_names) do
      add :header_name, :string, null: false

      timestamps()
    end

    create unique_index(:header_names, [:header_name])
  end
end
