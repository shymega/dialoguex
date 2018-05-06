defmodule MailStore.DB.Models.HeaderValue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "header_values" do
    field :value, :string

    timestamps()
  end

  def changeset(%_MODULE__{} = h_val, params) do
    h_val
    |> cast(params, ~w(value))
    |> unique_constraint(:value, message: "Oh dear; this value is already taken.")
  end
end
