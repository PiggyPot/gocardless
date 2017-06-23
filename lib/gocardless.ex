defmodule Gocardless do
  @moduledoc false
  use Application

  def start(_type, _args) do
    Gocardless.Client.start_link
  end
end