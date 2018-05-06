defmodule MailStore.DB.Models.Header do
  use Ecto.Schema
  import Ecto.Changeset

  alias MailStore.DB.Models.{HeaderKey, HeaderValue}

  schema "headers" do
    belongs_to :key, HeaderKey
    belongs_to :value, HeaderValue

    timestamps()
  end

  @required_fields ~w(key value)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
