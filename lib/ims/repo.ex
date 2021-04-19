defmodule Ims.Repo do
  use Ecto.Repo,
    otp_app: :ims,
    adapter: Ecto.Adapters.Postgres
end
