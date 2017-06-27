defmodule Gocardless.Api.Refund do
  import Gocardless.Utils.Comms

  def list(params) do
    url_params = params |> URI.encode_query

    request(:get, "/refunds?#{url_params}")
    |> decode_json
  end

  def get(refund_id) do
    request(:get, "/refunds/#{refund_id}")
    |> decode_json
  end

  def create(body) do
    request(:post, "/refunds", body)
    |> decode_json
  end

  def update(refund_id, body) do
    request(:put, "/refunds/#{refund_id}", body)
    |> decode_json
  end
end
