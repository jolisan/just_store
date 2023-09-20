defmodule JustStore.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      JustStoreWeb.Telemetry,
      # Start the Ecto repository
      JustStore.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: JustStore.PubSub},
      # Start the Endpoint (http/https)
      JustStoreWeb.Endpoint
      # Start a worker by calling: JustStore.Worker.start_link(arg)
      # {JustStore.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: JustStore.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    JustStoreWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
