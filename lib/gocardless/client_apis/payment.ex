defmodule Gocardless.ClientApi.Payment do
  defmacro __using__(_) do
    quote do
      alias Gocardless.Api.Payment
      @behaviour Gocardless.Behaviour.Payment

      # Customer API
      def list_payments(params \\ %{}) do
        GenServer.call(@client_name, {:list_payments, params})
      end

      def get_payment(payment_id) do
        GenServer.call(@client_name, {:get_payment, payment_id})
      end

      def create_payment(params) do
        GenServer.call(@client_name, {:create_payment, params})
      end

      def update_payment(payment_id, params) do
        GenServer.call(@client_name, {:update_payment, payment_id, params})
      end

      def cancel_payment(payment_id, params) do
        GenServer.call(@client_name, {:cancel_payment, payment_id, params})
      end

      def retry_payment(payment_id, params) do
        GenServer.call(@client_name, {:retry_payment, payment_id, params})
      end

      # Customer GenServer Callbacks
      def handle_call({:list_payments, params}, _from, state) do
        {:reply, Payment.list(params), state}
      end

      def handle_call({:get_payment, payment_id}, _from, state) do
        {:reply, Payment.get(payment_id), state}
      end

      def handle_call({:create_payment, params}, _from, state) do
        {:reply, Payment.create(params), state}
      end

      def handle_call({:update_payment, payment_id, params}, _from, state) do
        {:reply, Payment.update(payment_id, params), state}
      end

      def handle_call({:cancel_payment, payment_id, params}, _from, state) do
        {:reply, Payment.cancel(payment_id, params), state}
      end

      def handle_call({:retry_payment, payment_id, params}, _from, state) do
        {:reply, Payment.retry(payment_id, params), state}
      end
    end
  end
end