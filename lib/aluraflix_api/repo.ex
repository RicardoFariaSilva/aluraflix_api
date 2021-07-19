defmodule AluraflixApi.Repo do
  use Ecto.Repo,
    otp_app: :aluraflix_api,
    adapter: Ecto.Adapters.Postgres
end
