defmodule Gocardless.Behaviour.CreditorBankAccount do
  @moduledoc """
  Lists Creditor Bank Accounts from GoCardless

  ## Examples

      iex> Gocardless.Client.list_creditor_bank_accounts
      {:ok,
        %{"creditor_bank_accounts" => [%{"account_holder_name" => "JOHN DOE",
          "account_number_ending" => "11", "bank_name" => "BARCLAYS BANK PLC",
          "country_code" => "GB", "created_at" => "2017-06-27T11:16:37.353Z",
          "currency" => "GBP", "enabled" => true, "id" => "BA000999999999",
          "links" => %{"creditor" => "CR000099999999"}, "metadata" => %{}}],
          "meta" => %{"cursors" => %{"after" => nil, "before" => nil}, "limit" => 50}}}
  """
  @callback list_creditor_bank_accounts(map()) :: tuple()

  @doc """
  Gets a Creditor Bank Account based on their ID in GoCardless

  ## Examples

      iex> Gocardless.Client.get_creditor_bank_account("BA000999999999")
      {:ok,
        %{"creditor_bank_accounts" => %{"account_holder_name" => "JOHN DOE",
          "account_number_ending" => "11", "bank_name" => "BARCLAYS BANK PLC",
          "country_code" => "GB", "created_at" => "2017-06-27T11:16:37.353Z",
          "currency" => "GBP", "enabled" => true, "id" => "BA000999999999",
          "links" => %{"creditor" => "CR000099999999"}, "metadata" => %{}},
          "meta" => %{"cursors" => %{"after" => nil, "before" => nil}, "limit" => 50}}}
  """
  @callback get_creditor_bank_account(String.t) :: tuple()

  @doc """
  Creates a new Creditor Bank Account

  ## Examples

      iex> params = %{
        creditor_bank_accounts: %{
          account_holder_name: "John Doe",
          account_number: "55779911",
          branch_code: "200000",
          country_code: "GB",
          links: %{
            creditor: "CR000099999999"
          }
        }
      }
      iex> Gocardless.Client.create_creditor_bank_account("BA000999999999")
      {:ok,
        %{"creditor_bank_accounts" => %{"account_holder_name" => "JOHN DOE",
          "account_number_ending" => "11", "bank_name" => "BARCLAYS BANK PLC",
          "country_code" => "GB", "created_at" => "2017-06-27T11:16:37.353Z",
          "currency" => "GBP", "enabled" => true, "id" => "BA000999999999",
          "links" => %{"creditor" => "CR000099999999"}, "metadata" => %{}},
          "meta" => %{"cursors" => %{"after" => nil, "before" => nil}, "limit" => 50}}}
  """
  @callback create_creditor_bank_account(map()) :: tuple()

  @doc """
  Disables a Creditor Bank Account based on their ID in GoCardless

  ## Examples

      iex> Gocardless.Client.disable_creditor_bank_account("BA000999999999")
      {:ok,
        %{"creditor_bank_accounts" => %{"account_holder_name" => "JOHN DOE",
          "account_number_ending" => "11", "bank_name" => "BARCLAYS BANK PLC",
          "country_code" => "GB", "created_at" => "2017-06-27T11:16:37.353Z",
          "currency" => "GBP", "enabled" => false, "id" => "BA000999999999",
          "links" => %{"creditor" => "CR000099999999"}, "metadata" => %{}},
          "meta" => %{"cursors" => %{"after" => nil, "before" => nil}, "limit" => 50}}}
  """
  @callback disable_creditor_bank_account(String.t) :: tuple()
end