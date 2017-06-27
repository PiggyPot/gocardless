defmodule Gocardless.ClientApi.Creditor do
  defmacro __using__(_) do
    quote do
      alias Gocardless.Api.Creditor
      @behaviour Gocardless.Behaviour.Creditor

      # Creditor API
      def list_creditors(params \\ %{}) do
        GenServer.call(@client_name, {:list_creditors, params})
      end

      def get_creditor(creditor_id) do
        GenServer.call(@client_name, {:get_creditor, creditor_id})
      end

      def create_creditor(params) do
        GenServer.call(@client_name, {:create_creditor, params})
      end

      def update_creditor(creditor_id, params) do
        GenServer.call(@client_name, {:update_creditor, creditor_id, params})
      end

      # Creditor GenServer Callbacks
      def handle_call({:list_creditors, params}, _from, state) do
        {:reply, Creditor.list(params), state}
      end

      def handle_call({:get_creditor, creditor_id}, _from, state) do
        {:reply, Creditor.get(creditor_id), state}
      end

      def handle_call({:create_creditor, params}, _from, state) do
        {:reply, Creditor.create(params), state}
      end

      def handle_call({:update_creditor, creditor_id, params}, _from, state) do
        {:reply, Creditor.update(creditor_id, params), state}
      end
    end
  end
end