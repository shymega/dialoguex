defmodule MailStore.DB.Repo.Migrations.AlterHeadersReferences do
  use Ecto.Migration

  def change do
    alter table(:headers) do
      add :key_id, references(:header_keys, on_delete: :delete_all), null: false
      add :value_id, references(:header_values, on_delete: :delete_all), null: false
    end
  end
end
