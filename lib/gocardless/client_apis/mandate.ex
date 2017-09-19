defmodule Gocardless.ClientApi.Mandate do
  defmacro __using__(_) do
    quote do
      alias Gocardless.Api.Mandate
      @behaviour Gocardless.Behaviour.Mandate

      # Mandate API
      def list_mandates(params \\ %{}) do
        GenServer.call(@client_name, {:list_mandates, params})
      end

      def get_mandate(mandate_id) do
        GenServer.call(@client_name, {:get_mandate, mandate_id})
      end

      def create_mandate(params) do
        GenServer.call(@client_name, {:create_mandate, params})
      end

      def update_mandate(mandate_id, params) do
        GenServer.call(@client_name, {:update_mandate, mandate_id, params})
      end

      def cancel_mandate(mandate_id) do
        GenServer.call(@client_name, {:cancel_mandate, mandate_id})
      end

      def reinstate_mandate(mandate_id) do
        GenServer.call(@client_name, {:reinstate_mandate, mandate_id})
      end

      def pdf_preview(params) do
        GenServer.call(@client_name, {:pdf_preview, params})
      end

      # Mandate GenServer Callbacks
      def handle_call({:list_mandates, params}, _from, state) do
        {:reply, Mandate.list(params), state}
      end

      def handle_call({:get_mandate, mandate_id}, _from, state) do
        {:reply, Mandate.get(mandate_id), state}
      end

      def handle_call({:create_mandate, params}, _from, state) do
        {:reply, Mandate.create(params), state}
      end

      def handle_call({:update_mandate, mandate_id, params}, _from, state) do
        {:reply, Mandate.update(mandate_id, params), state}
      end

      def handle_call({:cancel_mandate, mandate_id}, _from, state) do
        {:reply, Mandate.cancel(mandate_id), state}
      end

      def handle_call({:reinstate_mandate, mandate_id}, _from, state) do
        {:reply, Mandate.reinstate(mandate_id), state}
      end

      def handle_call({:pdf_preview, params}, _from, state) do
        {:reply, Mandate.pdf_preview(params), state}
      end
    end
  end
end
