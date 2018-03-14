defmodule Jototter.Router do
  use Jototter.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  forward "/api", Absinthe.Plug,
    schema: Jototter.Schema
 
  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: Jototter.Schema
end
