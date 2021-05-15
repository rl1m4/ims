defmodule ImsWeb.WelcomeController do
  use ImsWeb, :controller

  alias Ims.Welcome

  def index(conn, params) do
    params
    |> Welcome.welcome()
    |> handle_response(conn)
  end

  defp handle_response({:ok, message}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: message})
  end

  defp handle_response({:errpr, message}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(%{message: message})
  end
end