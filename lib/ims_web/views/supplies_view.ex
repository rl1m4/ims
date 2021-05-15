defmodule ImsWeb.SuppliesView do
  use ImsWeb, :view

  def render("create.json", %{supply: supply}) do
    %{
      message: "Supply created",
      # supply is a struct not a map - it needs to render properly @derive
      suppply: supply
    }
  end
end
