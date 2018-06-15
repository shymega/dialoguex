defmodule DBStore.DB.Schemas.HeaderValue do
  use Ecto.Schema
  import Ecto.Changeset

  alias DBStore.DB.Schemas.Header

  schema "header_values" do
    field :header_value, :string
    field :header_value_hash, :string, size: 256

    belongs_to :header, Header

    timestamps()
  end

  @required_fields ~w(header_value)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:header_value)
  end
end
