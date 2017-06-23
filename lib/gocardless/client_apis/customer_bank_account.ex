defmodule Gocardless.ClientApi.CustomerBankAccount do
  defmacro __using__(_) do
    quote do
      alias Gocardless.Api.CustomerBankAccount
      @behaviour Gocardless.Behaviour.CustomerBankAccount

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
        GenServer.call(@client_name, {:disable_customer_bank_account, customer_bank_account_id})
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
  end
end