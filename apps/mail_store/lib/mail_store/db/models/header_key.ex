defmodule MailStore.DB.Models.HeaderKey do
  use Ecto.Schema
  import Ecto.Changeset

  schema "header_keys" do
    field :key, :string

    timestamps()
  end

  @required_fields ~w(key)
  @optional_fields ~w()

  def changeset(%__MODULE__{} = h_key, params) do
    h_key
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:key, message: "Oh dear; this key is already in use.")
  end
end
