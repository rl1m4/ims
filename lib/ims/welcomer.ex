defmodule Ims.Welcome do
  #  --data---->[Module.function]-data_modified-->[Module.function2]-->Result
  # Receive name and age - if user has name x and age x, receives a special msg
  # if user is age y -> receives a normal msg
  # if user is age w -> returns an error
  # Check for wrong user names

  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  # private defp - receives 2 params but sent just one above because |>
  defp evaluate("simba", 40) do
    # tuple
    {:ok, "Special"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Not Special #{name}"}
  end

  defp evaluate(name, age) do
    {:error, "Not pass #{name}"}
  end
end
