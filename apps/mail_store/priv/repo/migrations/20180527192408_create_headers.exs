defmodule MailStore.DB.Repo.Migrations.CreateHeaders do
  use Ecto.Migration

  def change do
    create table(:headers, primary_key: false) do
      add :id, :uuid, primary_key: true
    end
  end
end
