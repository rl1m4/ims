defmodule ImsWeb.RestaurantController do
  use ImsWeb, :controller

  alias Ims.{Restaurant, Restaurants.Create}

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Create.call(params) do
      conn
      |> put_status(:ok)
      |> render("create.json", restaurant: restaurant)
    end
  end
end
