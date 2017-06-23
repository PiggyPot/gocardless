defmodule Gocardless.Api.Customer do
  import Gocardless.Api.Base

  def list(params) do
    url_params = params |> URI.encode_query

    request(:get, "/customers?#{url_params}")
    |> decode_json
  end

  def get(customer_id) do
    request(:get, "/customers/#{customer_id}")
    |> decode_json
  end

  def create(body) do
    request(:post, "/customers", body)
    |> decode_json
  end

  def update(customer_id, body) do
    request(:put, "/customers/#{customer_id}", body)
    |> decode_json
  end
end