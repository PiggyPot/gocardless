defmodule Gocardless.Api.Subscription do
  import Gocardless.Utils.Comms

  def list(params) do
    url_params = params |> URI.encode_query

    request(:get, "/subscriptions?#{url_params}")
    |> decode_json
  end

  def get(subscription_id) do
    request(:get, "/subscriptions/#{subscription_id}")
    |> decode_json
  end

  def create(body) do
    request(:post, "/subscriptions", body)
    |> decode_json
  end

  def update(subscription_id, body) do
    request(:put, "/subscriptions/#{subscription_id}", body)
    |> decode_json
  end

  def cancel(subscription_id) do
    request(:post, "/subscriptions/#{subscription_id}/actions/cancel", %{})
    |> decode_json
  end
end
