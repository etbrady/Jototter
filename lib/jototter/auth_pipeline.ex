defmodule Jototter.Guardian.AuthPipeline do

  use Guardian.Plug.Pipeline, otp_app: :jototter,
                              module: Jototter.Guardian,
                              error_handler: Jototter.Guardian.AuthErrorHandler

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, ensure: true
end