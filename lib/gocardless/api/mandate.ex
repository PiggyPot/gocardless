defmodule Gocardless.Api.Mandate do
  import Gocardless.Utils.Comms

  def list(params \\ %{}) do
    url_params = params |> URI.encode_query

    request(:get, "/mandates?#{url_params}")
    |> decode_json
  end

  def get(mandate_id) do
    request(:get, "/mandates/#{mandate_id}")
    |> decode_json
  end

  def create(body) do
    request(:post, "/mandates", body)
    |> decode_json
  end

  def update(mandate_id, body) do
    request(:put, "/mandates/#{mandate_id}", body)
    |> decode_json
  end

  def cancel(mandate_id) do
    request(:post, "/mandates/#{mandate_id}/actions/cancel", %{})
    |> decode_json
  end

  def reinstate(mandate_id) do
    request(:post, "/mandates/#{mandate_id}/actions/reinstate", %{})
    |> decode_json
  end

  def pdf_preview(body) do
    :post
    |> request("/mandate_pdfs", body)
    |> decode_json()
  end
end
