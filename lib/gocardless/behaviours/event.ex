defmodule Gocardless.Behaviour.Event do
  @moduledoc """
  Defines the behaviour for Events, you cannot create or edit Events, only view them.
  """
  @doc """
  Lists all events

  ## Examples

      iex> Gocardless.Client.list_events
      {:ok,
       %{"events" => [%{"action" => "created",
            "created_at" => "2017-06-27T14:14:43.390Z",
            "details" => %{"cause" => "mandate_created",
              "description" => "Mandate created via the API.", "origin" => "api"},
            "id" => "EV000QBP163MV1", "links" => %{"mandate" => "MD000099999999"},
            "metadata" => %{}, "resource_type" => "mandates"}],
         "meta" => %{"cursors" => %{"after" => "EV000099999999", "before" => nil},
           "limit" => 50}}}
  """
  @callback list_events(map()) :: tuple()

  @doc """
  Gets an individual event by ID

  ## Examples

      iex> Gocardless.Client.get_event("EV000099999999")
      {:ok,
       %{"events" => %{"action" => "created",
           "created_at" => "2017-06-27T10:00:26.278Z",
           "details" => %{"cause" => "payment_refunded",
             "description" => "The refund has been created, and will be submitted in the next batch.",
             "origin" => "api"}, "id" => "EV000099999999",
           "links" => %{"refund" => "RF000099999999"}, "metadata" => %{},
           "resource_type" => "refunds"}}}
  """
  @callback get_event(String.t) :: tuple()
end
