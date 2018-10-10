defmodule DBStore.DB.Schemas.HeaderValue do
  use Ecto.Schema
  import Ecto.Changeset

  alias DBStore.DB.Schemas.Header

  schema "header_values" do
    field :header_value, :string
    field :header_value_hash, :string, size: 256

    has_one :header, Header

    timestamps()
  end

  @required_fields ~w(header_value header_value-hash)a

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:header_value, message: "Duplicate value for table `header_value`. This is not a fatal error.")
    |> unique_constraint(:header_value_hash, message: "Duplicate hash for table `header_value`. This is not a fatal error.")
  end
end
