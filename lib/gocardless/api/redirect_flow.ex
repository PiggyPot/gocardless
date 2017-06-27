defmodule Gocardless.Api.RedirectFlow do
  @moduledoc """
  Functions that map to Redirect Flow endpoints

  Talks to our `Gocardless.Utils.Comms` to do the requests
  """
  import Gocardless.Utils.Comms

  def get(redirect_flow_id) do
    :get
    |> request("/redirect_flows/#{redirect_flow_id}")
    |> decode_json
  end

  def create(body) do
    :post
    |> request("/redirect_flows", body)
    |> decode_json
  end

  def complete(redirect_flow_id, body) do
    :post
    |> request("/redirect_flows/#{redirect_flow_id}/actions/complete", body)
    |> decode_json
  end
end
