defmodule DBStore.Test do
  alias DBStore.DB.Repo
  alias DBStore.DB.Schemas.{Header, HeaderName, HeaderValue}

  def test_insert_db() do
    header_name = %HeaderName{
      header_name: "From"}

    header_value = %HeaderValue{
      header_value: "shymega@shymega.org.uk",
      header_value_hash: "e047e2fd81d503c02516465d9f1ae1ab1c74dc67838f763a8e55a2317da466d9"}

    header = %Header{header_name: header_name,
                     header_value: header_value}

    {:ok, header}
  end
end
