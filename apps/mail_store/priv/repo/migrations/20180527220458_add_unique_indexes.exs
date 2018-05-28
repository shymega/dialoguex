defmodule MailStore.DB.Repo.Migrations.AddUniqueIndexes do
  use Ecto.Migration

  def change do
    create unique_index(:header_keys, [:key])
    create unique_index(:header_values, [:value])
  end
end
