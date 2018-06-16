defmodule DBStore.DB.Schemas.HeaderName do
  use Ecto.Schema
  import Ecto.Changeset

  alias DBStore.DB.Schemas.Header

  schema "header_names" do
    field :header_name, :string

    has_one :header, Header

    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, :header_name)
    |> validate_required(:header_name)
    |> unique_constraint(:header_name, message: "Duplicate value.")
  end
end
