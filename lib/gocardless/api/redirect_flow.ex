defmodule Gocardless.Api.RedirectFlow do
  import Gocardless.Utils.Comms

  def get(redirect_flow_id) do
    request(:get, "/redirect_flows/#{redirect_flow_id}")
    |> decode_json
  end

  def create(body) do
    request(:post, "/redirect_flows", body)
    |> decode_json
  end

  def complete(redirect_flow_id, body) do
    request(:post, "/redirect_flows/#{redirect_flow_id}/actions/complete", body)
    |> decode_json
  end
end
