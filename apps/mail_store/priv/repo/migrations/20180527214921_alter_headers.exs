defmodule MailStore.DB.Repo.Migrations.AlterHeaders do
  use Ecto.Migration

  def change do
    alter table(:header_keys) do
      add :header_id, references(:headers, type: :uuid, column: :id)
    end
    
    alter table(:header_values) do
      add :header_id, references(:headers, type: :uuid, column: :id)
    end

    alter table(:headers) do
      add :header_key, references(:header_keys, type: :uuid, column: :id)
    end

    alter table(:headers) do
      add :header_values, references(:header_values, type: :uuid, column: :id)
    end
  end
end
