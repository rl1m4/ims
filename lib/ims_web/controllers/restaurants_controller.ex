defmodule ImsWeb.RestaurantsController do
  use ImsWeb, :controller

  alias Ims.{Restaurant, Restaurants.Create}
  alias ImsWeb.FallbackController

  # handle errors inside fallbackController
  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end
end
