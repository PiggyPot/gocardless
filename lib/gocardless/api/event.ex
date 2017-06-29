defmodule Gocardless.Api.Event do
  @moduledoc """
  Functions that map to Event endpoints

  Talks to our `Gocardless.Utils.Comms` to do the requests
  """
  import Gocardless.Utils.Comms

  def list(params) do
    url_params = URI.encode_query(params)

    :get
    |> request("/events?#{url_params}")
    |> decode_json
  end

  def get(event_id) do
    :get
    |> request("/events/#{event_id}")
    |> decode_json
  end
end
