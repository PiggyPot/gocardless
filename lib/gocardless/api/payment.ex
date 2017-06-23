defmodule Gocardless.Api.Payment do
  import Gocardless.Api.Base

  def list(params \\ %{}) do
    url_params = params |> URI.encode_query

    request(:get, "/payments?#{url_params}")
    |> decode_json
  end

  def get(payment_id) do
    request(:get, "/payments/#{payment_id}")
    |> decode_json
  end

  def create(body) do
    request(:post, "/payments", body)
    |> decode_json
  end

  def update(payment_id, body) do
    request(:put, "/payments/#{payment_id}", body)
    |> decode_json
  end

  def cancel(payment_id, body) do
    request(:post, "/payments/#{payment_id}/actions/cancel", body)
    |> decode_json
  end

  def retry(payment_id, body) do
    request(:post, "/payments/#{payment_id}/actions/retry", body)
    |> decode_json
  end
end
