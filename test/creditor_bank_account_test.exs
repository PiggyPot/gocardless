defmodule CreditorBankAccountTest do
  use ExUnit.Case

  test "list_creditor_bank_accounts returns response formated as required" do
    {:ok, %{"creditor_bank_accounts" => creditor_ba}} = Gocardless.Client.list_creditor_bank_accounts
    assert is_list(creditor_ba)
  end

  test "create_creditor_bank_account creates a creditor bank account" do
    {:ok, %{"creditor_bank_accounts" => new_creditor_ba}} = create_creditor_bank_account()

    {:ok, %{"creditor_bank_accounts" => creditor}} = 
      Gocardless.Client.get_creditor_bank_account(new_creditor_ba["id"])

    assert creditor["account_holder_name"] == "JOHN DOE"
  end

  test "disable_creditor_bank_account disables a creditor bank account" do
    {:ok, %{"creditor_bank_accounts" => new_creditor_ba}} = create_creditor_bank_account()

    Gocardless.Client.disable_creditor_bank_account(new_creditor_ba["id"])

    {:ok, %{"creditor_bank_accounts" => creditor_bank_account}} = 
      Gocardless.Client.get_creditor_bank_account(new_creditor_ba["id"])

    assert creditor_bank_account["enabled"] == false
  end

  defp create_creditor_bank_account do
    creditor_params = %{
      creditors: %{
        name: "Test Creditor"
      }
    }

    {:ok, %{"creditors" => new_creditor}} = 
      Gocardless.Client.create_creditor(creditor_params)

    creditor_ba_params = %{
      creditor_bank_accounts: %{
        account_holder_name: "John Doe",
        account_number: "55779911",
        branch_code: "200000",
        country_code: "GB",
        links: %{
          creditor: new_creditor["id"]
        }
      }
    }

    Gocardless.Client.create_creditor_bank_account(creditor_ba_params)
  end
end
