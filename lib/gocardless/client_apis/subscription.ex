defmodule Gocardless.ClientApi.Subscription do
  @moduledoc false
  defmacro __using__(_) do
    quote do
      alias Gocardless.Api.Subscription
      @behaviour Gocardless.Behaviour.Subscription

      # Subscription API
      def list_subscriptions(params \\ %{}) do
        GenServer.call(@client_name, {:list_subscriptions, params})
      end

      def get_subscription(subscription_id) do
        GenServer.call(@client_name, {:get_subscription, subscription_id})
      end

      def create_subscription(params) do
        GenServer.call(@client_name, {:create_subscription, params})
      end

      def update_subscription(subscription_id, params) do
        GenServer.call(@client_name, {:update_subscription, subscription_id, params})
      end

      def cancel_subscription(subscription_id) do
        GenServer.call(@client_name, {:cancel_subscription, subscription_id})
      end

      # Subscription GenServer Callbacks
      def handle_call({:list_subscriptions, params}, _from, state) do
        {:reply, Subscription.list(params), state}
      end

      def handle_call({:get_subscription, subscription_id}, _from, state) do
        {:reply, Subscription.get(subscription_id), state}
      end

      def handle_call({:create_subscription, params}, _from, state) do
        {:reply, Subscription.create(params), state}
      end

      def handle_call({:update_subscription, subscription_id, params}, _from, state) do
        {:reply, Subscription.update(subscription_id, params), state}
      end

      def handle_call({:cancel_subscription, subscription_id}, _from, state) do
        {:reply, Subscription.cancel(subscription_id), state}
      end
    end
  end
end
