defmodule MailStore.DB.Schemas.HeaderValue do
  use Ecto.Schema

  import Ecto.Changeset

  alias MailStore.DB.Schemas.Header

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "header_values" do
    field :value, :string
    field :hash, :string
    belongs_to :header, Header
  end

  @required_fields ~w(value)
  @optional_fields ~w(hash)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, [])
#    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:value)
  end
end
