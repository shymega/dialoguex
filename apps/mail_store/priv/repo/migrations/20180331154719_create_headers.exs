defmodule MailStore.Repo.Migrations.CreateHeaders do
  use Ecto.Migration

  def change do
    create table(:headers) do
      timestamps()
    end
  end
end
