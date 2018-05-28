defmodule MailStore.DB.Models.Header do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "headers" do
    has_one :header_key, MailStore.DB.Models.HeaderKey
    has_one :header_value, MailStore.DB.Models.HeaderValue
  end

  @fields ~w(header_key header_value)

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @fields)
  end
end
