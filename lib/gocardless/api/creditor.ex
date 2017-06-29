defmodule Gocardless.Api.Creditor do
  import Gocardless.Utils.Comms

  def list(params \\ %{}) do
    url_params = params |> URI.encode_query

    request(:get, "/creditors?#{url_params}")
    |> decode_json
  end

  def get(creditor_id) do
    request(:get, "/creditors/#{creditor_id}")
    |> decode_json
  end

  def create(body) do
    request(:post, "/creditors", body)
    |> decode_json
  end

  def update(creditor_id, body) do
    request(:put, "/creditors/#{creditor_id}", body)
    |> decode_json
  end
end
