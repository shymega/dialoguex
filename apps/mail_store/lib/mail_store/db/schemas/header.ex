defmodule MailStore.DB.Schemas.Header do
  use Ecto.Schema
  import Ecto.Changeset

  alias MailStore.DB.Schemas.{HeaderKey, HeaderValue}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "headers" do
    has_one :header_key, HeaderKey
    has_one :header_value, HeaderValue
  end

  @required_fields ~w()
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
