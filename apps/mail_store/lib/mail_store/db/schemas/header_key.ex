defmodule MailStore.DB.Schemas.HeaderKey do
  use Ecto.Schema

  import Ecto.Changeset

  alias MailStore.DB.Schemas.Header

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "header_keys" do
    field :key, :string
    belongs_to :header, Header
  end

  @required_fields ~w(key)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, [])
#    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:key)
  end
end
