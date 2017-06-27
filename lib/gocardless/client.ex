defmodule Gocardless.Client do
  @moduledoc """
  Starts up Gocardless Client

  Uses `Gocardless.ClientApi.Customer` and other client APIs
  from `/lib/client_apis/`
  """
  @client_name Gocardless.Client
  use GenServer
  use Gocardless.ClientApi.{Customer, CustomerBankAccount, Mandate, Payment, Creditor}
  
  @doc false
  def start_link do
    initial_state = %{}
    GenServer.start_link(__MODULE__, initial_state, [name: @client_name])
  end
end
