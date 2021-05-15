defmodule Ims.Restaurant do
  use Ecto.Schema
  #https://hexdocs.pm/ecto/Ecto.Changeset.html
  #ecto documentation, validation, schema, etc
  import Ecto.Changeset

  # module variable @sample
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "restaurants" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{} #replace to Ims.Restaurant
    |> cast(params, [:email, :name]) #atom list
    |> validate_required([:email, :name]) #validation
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/) #regex email
    |> unique_constraint([:email])
  end
end
