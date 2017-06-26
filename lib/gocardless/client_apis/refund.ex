defmodule Gocardless.ClientApi.Refund do
  defmacro __using__(_) do
    quote do
      alias Gocardless.Api.Refund
      @behaviour Gocardless.Behaviour.Refund

      # Refund API
      def list_refunds(params \\ %{}) do
        GenServer.call(@client_name, {:list_refunds, params})
      end

      def get_refund(refund_id) do
        GenServer.call(@client_name, {:get_refund, refund_id})
      end

      def create_refund(params) do
        GenServer.call(@client_name, {:create_refund, params})
      end

      def update_refund(refund_id, params) do
        GenServer.call(@client_name, {:update_refund, refund_id, params})
      end

      # Refund GenServer Callbacks
      def handle_call({:list_refunds, params}, _from, state) do
        {:reply, Refund.list(params), state}
      end

      def handle_call({:get_refund, refund_id}, _from, state) do
        {:reply, Refund.get(refund_id), state}
      end

      def handle_call({:create_refund, params}, _from, state) do
        {:reply, Refund.create(params), state}
      end

      def handle_call({:update_refund, refund_id, params}, _from, state) do
        {:reply, Refund.update(refund_id, params), state}
      end
    end
  end
end
