defmodule Gocardless.Client do
  use GenServer
  alias Gocardless.Api.Customer
  @behaviour Gocardless.Behaviour
  @client_name Gocardless.Client

  # Client API

  @doc false
  def start_link do
    initial_state = %{}
    GenServer.start_link(__MODULE__, initial_state, [name: @client_name])
  end

  def list_customers(params \\ %{}) do
    GenServer.call(@client_name, {:list_customers, params})
  end

  def get_customer(customer_id) do
    GenServer.call(@client_name, {:get_customer, customer_id})
  end

  def create_customer(params) do
    GenServer.call(@client_name, {:create_customer, params})
  end

  def update_customer(customer_id, params) do
    GenServer.call(@client_name, {:update_customer, customer_id, params})
  end

  # GenServer callbacks

  def handle_call({:list_customers, params}, _from, state) do
    {:reply, Customer.list(params), state}
  end

  def handle_call({:get_customer, customer_id}, _from, state) do
    {:reply, Customer.get(customer_id), state}
  end

  def handle_call({:create_customer, params}, _from, state) do
    {:reply, Customer.create(params), state}
  end

  def handle_call({:update_customer, customer_id, params}, _from, state) do
    {:reply, Customer.update(customer_id, params), state}
  end
end
