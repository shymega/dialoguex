defmodule DBStore.DB.Repo.Migrations.AlterHeadersTable do
  use Ecto.Migration

  def change do
    alter table(:headers) do
      add :header_name_id, references(:header_names)
    end

    alter table(:headers) do
      add :header_value_id, references(:header_values)
    end
  end
end
