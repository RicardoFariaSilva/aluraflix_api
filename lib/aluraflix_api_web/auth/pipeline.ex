defmodule AluraflixApiWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :aluraflix_api,
    module: AluraflixApiWeb.Auth.Guardian,
    error_handler: AluraflixApiWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
