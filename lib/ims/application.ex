defmodule Ims.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Ims.Repo,
      # Start the Telemetry supervisor
      ImsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ims.PubSub},
      # Start the Endpoint (http/https)
      ImsWeb.Endpoint
      # Start a worker by calling: Ims.Worker.start_link(arg)
      # {Ims.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ims.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ImsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
