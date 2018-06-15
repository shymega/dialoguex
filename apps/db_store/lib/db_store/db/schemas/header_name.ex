defmodule DBStore.DB.Schemas.HeaderName do
  use Ecto.Schema
  import Ecto.Changeset

  alias DBStore.DB.Schemas.Header

  schema "header_names" do
    field :header_name, :string

    belongs_to :header, Header

    timestamps()
  end

  @required_fields ~w(header_name)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:header_name)
  end
end
