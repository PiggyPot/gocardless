defmodule Gocardless.Client do
  use GenServer
  alias Gocardless.Api.{Customer, CustomerBankAccount}
  @behaviour Gocardless.Behaviour
  @client_name Gocardless.Client

  # Client API

  @doc false
  def start_link do
    initial_state = %{}
    GenServer.start_link(__MODULE__, initial_state, [name: @client_name])
  end

  # Customer API
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

  # CustomerBankAccount API
  def list_customer_bank_accounts(params \\ %{}) do
    GenServer.call(@client_name, {:list_customer_bank_accounts, params})
  end

  def get_customer_bank_account(customer_bank_account_id) do
    GenServer.call(@client_name, {:get_customer_bank_account, customer_bank_account_id})
  end
  
  def create_customer_bank_account(params) do
    GenServer.call(@client_name, {:create_customer_bank_account, params})
  end
  
  def update_customer_bank_account(customer_bank_account_id, params) do
    GenServer.call(@client_name, {:update_customer_bank_account, customer_bank_account_id, params})
  end

  def disable_customer_bank_account(customer_bank_account_id) do
    GenServer.call(@client_name, {:update_customer_bank_account, customer_bank_account_id, params})
  end

  # GenServer callbacks

  # Customer GenServer Callbacks
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

  # CustomerBankAccount GenServer Callbacks
  def handle_call({:list_customer_bank_accounts, params}, _from, state) do
    {:reply, CustomerBankAccount.list(params), state}
  end

  def handle_call({:get_customer_bank_account, customer_bank_account_id}, _from, state) do
    {:reply, CustomerBankAccount.get(customer_bank_account_id), state}
  end

  def handle_call({:create_customer_bank_account, params}, _from, state) do
    {:reply, CustomerBankAccount.create(params), state}
  end

  def handle_call({:update_customer_bank_account, customer_bank_account_id, params}, _from, state) do
    {:reply, CustomerBankAccount.update(customer_bank_account_id, params), state}
  end

  def handle_call({:disable_customer_bank_account, customer_bank_account_id}, _from, state) do
    {:reply, CustomerBankAccount.disable(customer_bank_account_id), state}
  end
end
