defmodule Gocardless.Behaviour.Payout do
  @moduledoc """
  Defines the behaviour for Payouts, you cannot create or edit Payouts, only view them.
  """
  @doc """
  Lists all payouts

  ## Examples

      iex> Gocardless.Client.list_payouts
      {:ok,
       %{"meta" => %{"cursors" => %{"after" => nil, "before" => nil}, "limit" => 50},
         "payouts" => [%{"amount" => 9900, "arrival_date" => "2017-06-27",
            "created_at" => "2017-06-27T09:51:33.167Z", "currency" => "GBP",
            "deducted_fees" => 100, "id" => "PO000999999998",
            "links" => %{"creditor" => "CR000999999998",
              "creditor_bank_account" => "BA000999999998"},
            "payout_type" => "merchant", "reference" => "REF-REF",
            "status" => "paid"}]}}
  """
  @callback list_payouts(map()) :: tuple()

  @doc """
  Gets an individual payout by ID

  ## Examples

      iex> Gocardless.Client.get_payout("PO000099999999")
      {:ok,
       %{"payouts" => %{"amount" => 9900, "arrival_date" => "2017-06-27",
           "created_at" => "2017-06-27T09:51:33.167Z", "currency" => "GBP",
           "deducted_fees" => 100, "id" => "PO000099999999",
           "links" => %{"creditor" => "CR000099999999",
             "creditor_bank_account" => "BA000099999999"},
           "payout_type" => "merchant", "reference" => "REF-REF",
           "status" => "paid"}}}
  """
  @callback get_payout(String.t) :: tuple()
end
