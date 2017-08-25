defmodule Gocardless do
  @moduledoc false
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      worker(Gocardless.Client, [])
    ], strategy: :one_for_one, name: GoCardless.Supervisor)
  end
end
