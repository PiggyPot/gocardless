defmodule Gocardless.Api.Subscription do
  import Gocardless.Utils.Comms

  def list(params) do
    url_params = params |> URI.encode_query

    :get
    |> request("/subscriptions?#{url_params}")
    |> decode_json
  end

  def get(subscription_id) do
    :get
    |> request("/subscriptions/#{subscription_id}")
    |> decode_json
  end

  def create(body) do
    :post
    |> request("/subscriptions", body)
    |> decode_json
  end

  def update(subscription_id, body) do
    :put
    |> request("/subscriptions/#{subscription_id}", body)
    |> decode_json
  end

  def cancel(subscription_id) do
    :post
    |> request("/subscriptions/#{subscription_id}/actions/cancel", %{})
    |> decode_json
  end
end
