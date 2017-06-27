defmodule Gocardless.Api.CreditorBankAccount do
  @moduledoc false

  import Gocardless.Utils.Comms

  def list(params \\ %{}) do
    url_params = params |> URI.encode_query

    request(:get, "/creditor_bank_accounts?#{url_params}")
    |> decode_json
  end

  def get(creditor_bank_account_id) do
    request(:get, "/creditor_bank_accounts/#{creditor_bank_account_id}")
    |> decode_json
  end

  def create(body) do
    request(:post, "/creditor_bank_accounts", body)
    |> decode_json
  end

  def disable(creditor_bank_account_id) do
    request(:post, "/creditor_bank_accounts/#{creditor_bank_account_id}/actions/disable", %{})
    |> decode_json
  end
end
