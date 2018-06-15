defmodule DBStore.DB.Schemas.Header do
  use Ecto.Schema
  import Ecto.Changeset

  alias DBStore.DB.Schemas.HeaderName
  alias DBStore.DB.Schemas.HeaderValue

  schema "headers" do
    has_one :header_name, HeaderName
    has_one :header_value, HeaderValue

    timestamps()
  end

  @required_fields ~w(header_name, header_value)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> foreign_key_constraint(:header_name)
    |> foreign_key_constraint(:header_value)
    end
end
