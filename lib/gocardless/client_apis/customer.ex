defmodule Gocardless.ClientApi.Customer do
  defmacro __using__(_) do
    quote do
      alias Gocardless.Api.Customer
      @behaviour Gocardless.Behaviour.Customer

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
    end
  end
end