defmodule Ims.Supply do
  use Ecto.Schema
  # https://hexdocs.pm/ecto/Ecto.Changeset.html
  # ecto documentation, validation, schema, etc
  import Ecto.Changeset

  alias Ims.Restaurant

  # module variable @sample
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:description, :expiration_date, :responsible, :restaurant_id]

  # render  structs to json - ie. Restaurants struct
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "supplies" do
    field :description, :string
    field :expiration_date, :date
    field :responsible, :string

    belongs_to :restaurant, Restaurant

    timestamps()
  end

  def changeset(params) do
    # replace to Ims.Supply
    %__MODULE__{}
    # atom list
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 3)
    |> validate_length(:responsible, min: 3)
  end
end
