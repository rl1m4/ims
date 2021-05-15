defmodule Ims do
  @moduledoc """
  Ims keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Ims.Restaurants.Create, as: RestaurantCreate
  alias Ims.Supplies.Create, as: SupplyCreate
  alias Ims.Supplies.Get, as: SupplyGet

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call

  defdelegate create_supply(params), to: SupplyCreate, as: :call

  defdelegate get_supply(params), to: SupplyGet, as: :call
end
