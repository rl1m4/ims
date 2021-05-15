defmodule Ims.Restaurant do
  use Ecto.Schema
  # https://hexdocs.pm/ecto/Ecto.Changeset.html
  # ecto documentation, validation, schema, etc
  import Ecto.Changeset

  # module variable @sample
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "restaurants" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  def changeset(params) do
    # replace to Ims.Restaurant
    %__MODULE__{}
    # atom list
    |> cast(params, [:email, :name])
    # validation
    |> validate_required([:email, :name])
    |> validate_length(:name, min: 2)
    # regex email
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
