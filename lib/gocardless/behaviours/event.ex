defmodule Gocardless.Behaviour.Event do
  @moduledoc """
  Defines the behaviour for Events, you cannot create or edit Events, only view them.
  """
  @doc """
  Lists all events

  ## Examples

      iex> Gocardless.Client.list_events
  """
  @callback list_events(map()) :: tuple()

  @doc """
  Gets an individual event by ID

  ## Examples

      iex> Gocardless.Client.get_event("PO000099999999")
  """
  @callback get_event(String.t) :: tuple()
end
