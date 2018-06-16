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

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, :header_value)
    |> validate_required(:header_value)
    |> unique_constraint(:header_value, message: "Duplicate value value.")
  end
end
