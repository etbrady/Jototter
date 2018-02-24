defmodule Jototter.Router do
  use Jototter.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Jototter do
    pipe_through :api
  end
end
