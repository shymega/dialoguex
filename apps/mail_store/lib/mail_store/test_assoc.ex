defmodule MailStore.TestAssoc do
  alias MailStore.DB.Repo
  alias MailStore.DB.Schemas.{Header, HeaderKey, HeaderVal}

  def test do
    header_key = HeaderKey.changeset(%HeaderKey{}, %{key: "From"})
    header_val = HeaderVal.changeset(%HeaderVal{}, %{val: "john.doe@example.com"})
    params = %{header_key: header_key, header_val: header_val}

    IO.inspect(params)

    params
  end
end

