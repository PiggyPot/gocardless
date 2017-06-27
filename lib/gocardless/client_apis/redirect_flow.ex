defmodule Gocardless.ClientApi.RedirectFlow do
  @moduledoc """
  Creates our internal functions for Redirect Flows that link to GenServer calls
  """
  defmacro __using__(_) do
    quote do
      alias Gocardless.Api.RedirectFlow
      @behaviour Gocardless.Behaviour.RedirectFlow

      # RedirectFlow API
      def get_redirect_flow(redirect_flow_id) do
        GenServer.call(@client_name, {:get_redirect_flow, redirect_flow_id})
      end

      def create_redirect_flow(params) do
        GenServer.call(@client_name, {:create_redirect_flow, params})
      end

      def complete_redirect_flow(redirect_flow_id, params) do
        GenServer.call(@client_name, {:complete_redirect_flow, redirect_flow_id, params})
      end

      # RedirectFlow GenServer Callbacks
      def handle_call({:get_redirect_flow, redirect_flow_id}, _from, state) do
        {:reply, RedirectFlow.get(redirect_flow_id), state}
      end

      def handle_call({:create_redirect_flow, params}, _from, state) do
        {:reply, RedirectFlow.create(params), state}
      end

      def handle_call({:complete_redirect_flow, redirect_flow_id, params}, _from, state) do
        {:reply, RedirectFlow.complete(redirect_flow_id, params), state}
      end
    end
  end
end
