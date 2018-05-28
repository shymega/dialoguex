defmodule MailStore.DB.Models.HeaderKey do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "header_keys" do
    field :key, :string
    belongs_to :header, MailStore.DB.Models.Header
  end

  @fields ~w(key)

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @fields)
    |> unique_constraint(:key)
  end
end
