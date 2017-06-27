defmodule Gocardless.ClientApi.Event do
  @moduledoc """
  Creates our internal functions for Events that link to GenServer calls
  """
  defmacro __using__(_) do
    quote do
      alias Gocardless.Api.Event
      @behaviour Gocardless.Behaviour.Event

      # Event API
      def list_events(params \\ %{}) do
        GenServer.call(@client_name, {:list_events, params})
      end

      def get_event(event_id) do
        GenServer.call(@client_name, {:get_event, event_id})
      end

      # Event GenServer Callbacks
      def handle_call({:list_events, params}, _from, state) do
        {:reply, Event.list(params), state}
      end

      def handle_call({:get_event, event_id}, _from, state) do
        {:reply, Event.get(event_id), state}
      end
    end
  end
end
