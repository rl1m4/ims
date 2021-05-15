defmodule Ims.Restaurants.Create do
  alias Ims.{Repo, Restaurant}

  def call(params) do
    params
    |> Restaurant.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Restaurant{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end

"""
 %{
   result: #Ecto.Changeset<
     action: :insert,
     changes: %{email: "test@test", name: "test"},
     errors: [
       email: {"has already been taken",
        [constraint: :unique, constraint_name: "restaurants_email_index"]}
     ],
     data: #Ims.Restaurant<>,
     valid?: false
   >,
   status: :bad_request
 }}
iex(16)> params = %{name: "test", email: "test@test1"}
%{email: "test@test1", name: "test"}
iex(17)> Create.call(params)
[debug] QUERY OK db=2.9ms queue=2.6ms idle=1812.5ms
INSERT INTO "restaurants" ("email","name","inserted_at","updated_at","id") VALUES ($1,$2,$3,$4,$5) ["test@test1", "test", ~N[2021-05-15 13:33:47], ~N[2021-05-15 13:33:47], <<67, 84, 148, 45, 64, 28, 70, 165, 146, 190, 129, 245, 196, 28, 50, 22>>]
{:ok,
 %Ims.Restaurant{
   __meta__: #Ecto.Schema.Metadata<:loaded, "restaurants">,
   email: "test@test1",
   id: "4354942d-401c-46a5-92be-81f5c41c3216",
   inserted_at: ~N[2021-05-15 13:33:47],
   name: "test",
   updated_at: ~N[2021-05-15 13:33:47]
 }}
"""
