defmodule Gocardless.ClientApi.Payout do
  @moduledoc """
  Creates our internal functions for Payouts that link to GenServer calls
  """
  defmacro __using__(_) do
    quote do
      alias Gocardless.Api.Payout
      @behaviour Gocardless.Behaviour.Payout

      # Payout API
      def list_payouts(params \\ %{}) do
        GenServer.call(@client_name, {:list_payouts, params})
      end

      def get_payout(payout_id) do
        GenServer.call(@client_name, {:get_payout, payout_id})
      end

      # Payout GenServer Callbacks
      def handle_call({:list_payouts, params}, _from, state) do
        {:reply, Payout.list(params), state}
      end

      def handle_call({:get_payout, payout_id}, _from, state) do
        {:reply, Payout.get(payout_id), state}
      end
    end
  end
end
