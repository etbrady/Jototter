defmodule Jototter.Router do
  use Jototter.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug Jototter.Guardian.AuthPipeline
    plug Jototter.Web.Context
  end

  scope "/api" do 
    pipe_through :graphql 
    
    forward "/", Absinthe.Plug,
    schema: Jototter.Schema
  end 

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: Jototter.Schema
end
