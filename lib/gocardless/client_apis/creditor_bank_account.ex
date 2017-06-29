defmodule Gocardless.ClientApi.CreditorBankAccount do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      alias Gocardless.Api.CreditorBankAccount
      @behaviour Gocardless.Behaviour.CreditorBankAccount

      # Creditor API
      def list_creditor_bank_accounts(params \\ %{}) do
        GenServer.call(@client_name, {:list_creditor_bank_accounts, params})
      end

      def get_creditor_bank_account(creditor_bank_account_id) do
        GenServer.call(@client_name, {:get_creditor_bank_account, creditor_bank_account_id})
      end

      def create_creditor_bank_account(params) do
        GenServer.call(@client_name, {:create_creditor_bank_account, params})
      end

      def disable_creditor_bank_account(creditor_bank_account_id) do
        GenServer.call(@client_name, {:disable_creditor_bank_account, creditor_bank_account_id})
      end

      # Creditor GenServer Callbacks
      def handle_call({:list_creditor_bank_accounts, params}, _from, state) do
        {:reply, CreditorBankAccount.list(params), state}
      end

      def handle_call({:get_creditor_bank_account, creditor_bank_account_id}, _from, state) do
        {:reply, CreditorBankAccount.get(creditor_bank_account_id), state}
      end

      def handle_call({:create_creditor_bank_account, params}, _from, state) do
        {:reply, CreditorBankAccount.create(params), state}
      end

      def handle_call({:disable_creditor_bank_account, creditor_bank_account_id}, _from, state) do
        {:reply, CreditorBankAccount.disable(creditor_bank_account_id), state}
      end
    end
  end
end
