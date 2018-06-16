defmodule DBStore.DB.Schemas.Header do
  use Ecto.Schema
  import Ecto.Changeset

  alias DBStore.DB.Schemas.HeaderName
  alias DBStore.DB.Schemas.HeaderValue

  schema "headers" do
    belongs_to :header_name, HeaderName
    belongs_to :header_value, HeaderValue

    timestamps()
  end

  @required_fields ~w(header_name header_value)

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:header_name, message: "Failed to add duplicate entry. This is normal.")
    |> unique_constraint(:header_value, message: "Failed to add duplicate entry. This is normal.")
    end
end
