defmodule JustStore.Repo do
  use Ecto.Repo,
    otp_app: :just_store,
    adapter: Ecto.Adapters.Postgres
end
