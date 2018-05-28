defmodule MailStore.DB.Models.HeaderValue do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "header_values" do
    field :value, :string
    belongs_to :header, MailStore.DB.Models.Header
  end

  @fields ~w(value)

  def changeset(model, params) do
    model
    |> cast(params, @fields)
    |> unique_constraint(:value)
  end
end
