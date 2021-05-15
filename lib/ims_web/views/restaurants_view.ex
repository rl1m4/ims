defmodule ImsWeb.RestaurantsView do
  use ImsWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created",
      # restaurant is a struct not a map - it needs to render properly @derive
      restaurant: restaurant
    }
  end
end

"""
Jason.encode(%{a: 1, b: 2})
"""
