defmodule OauthenatorApp do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(__MODULE__, [], function: :run),
      worker(OauthenatorApp.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: OauthenatorApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def run do
    {:ok, _} = Plug.Adapters.Cowboy.http OauthenatorApp.Router, [], port: 5500
  end
end
