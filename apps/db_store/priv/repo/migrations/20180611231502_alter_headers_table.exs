defmodule DBStore.DB.Repo.Migrations.AlterHeadersTable do
  use Ecto.Migration

  def change do
    alter table(:header_names) do
      add :header_id, references(:headers), null: false
    end

    alter table(:header_values) do
      add :header_id, references(:headers), null: false
    end
  end
end
