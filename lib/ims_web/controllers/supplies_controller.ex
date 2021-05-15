defmodule ImsWeb.SuppliesController do
  use ImsWeb, :controller

  alias Ims.{Supply}
  alias ImsWeb.FallbackController

  # handle errors inside fallbackController
  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- Ims.create_supply(params) do
      conn
      |> put_status(:created)
      |> render("create.json", supply: supply)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Supply{} = supply} <- Ims.get_supply(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end
end
