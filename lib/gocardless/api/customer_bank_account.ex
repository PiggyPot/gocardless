defmodule Gocardless.Api.CustomerBankAccount do
  import Gocardless.Utils.Comms

  def list(params) do
    url_params = params |> URI.encode_query

    request(:get, "/customer_bank_accounts?#{url_params}")
    |> decode_json
  end

  def get(customer_bank_account_id) do
    request(:get, "/customer_bank_accounts/#{customer_bank_account_id}")
    |> decode_json
  end

  def create(body) do
    request(:post, "/customer_bank_accounts", body)
    |> decode_json
  end

  def update(customer_bank_account_id, body) do
    request(:put, "/customer_bank_accounts/#{customer_bank_account_id}", body)
    |> decode_json
  end

  def disable(customer_bank_account_id) do
    request(:post, "/customer_bank_accounts/#{customer_bank_account_id}/actions/disable", %{})
    |> decode_json  
  end
end