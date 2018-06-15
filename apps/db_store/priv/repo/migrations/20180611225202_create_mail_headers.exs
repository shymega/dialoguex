defmodule DBStore.DB.Repo.Migrations.CreateMailHeaders do
  use Ecto.Migration

  def change do
    create table(:headers) do
      timestamps()
    end
  end
end
