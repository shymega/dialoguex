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

  def changeset(model, params \\ %{}) do
    IO.inspect(params)
    IO.inspect(model)

    model
    |> cast(params, [])
    |> cast_assoc(:header_key, with: &HeaderKey.changeset/2, required: true)
    |> cast_assoc(:header_value, with: &HeaderValue.changeset/2, required: true)
  end
end
