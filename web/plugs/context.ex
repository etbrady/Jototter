defmodule Jototter.Web.Context do
  @behaviour Plug
 
  import Plug.Conn

  alias Jototter.Guardian
 
  def init(opts), do: opts
 
  def call(conn, _) do
    case Guardian.Plug.current_resource(conn) do
      nil -> conn
      user ->
        put_private(conn, :absinthe, %{context: %{authenticated_user: user}})
    end
  end
end