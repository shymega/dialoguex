defmodule DBStore.DB.Schemas.HeaderName do
  use Ecto.Schema
  import Ecto.Changeset

  alias DBStore.DB.Schemas.Header

  schema "header_names" do
    field(:header_name, :string)

    has_one(:header, Header)

    timestamps()
  end

  @required_fields ~w(header_name)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:header_name,
      message: "Duplicate value for table `header_names`. This is not a fatal error."
    )
  end
end
