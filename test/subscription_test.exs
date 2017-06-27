defmodule SubscriptionTest do
  use ExUnit.Case

  test "list_subscriptions returns response formated as required" do
    {:ok, %{"subscriptions" => subscriptions}} = Gocardless.Client.list_subscriptions
    assert is_list(subscriptions)
  end

  test "create_subscription creates a subscription" do
    new_mandate = prepare_mandate()

    params = %{
      subscriptions: %{
        amount: "2500",
        currency: "GBP",
        name: "Test Subscription",
        interval_unit: "monthly",
        day_of_month:  "1",
        links: %{mandate: new_mandate["id"]}
      }
    }

    {:ok, %{"subscriptions" => new_subscription}} = Gocardless.Client.create_subscription(params)
    assert new_subscription["name"] == "Test Subscription"
  end

  test "update_subscription updates a subscription" do
    params = %{
      subscriptions: %{name: "Updated subscription"}
    }

    {:ok, %{"subscriptions" => updated_subscription}} = Gocardless.Client.update_subscription(get_last_subscription_id(), params)

    assert updated_subscription["name"] == "Updated subscription"
  end

  test "get_subscription returns a subscription" do
    subscription_id = get_last_subscription_id()
    {:ok, %{"subscriptions" => subscription}} = Gocardless.Client.get_subscription(subscription_id)
    assert subscription["id"] == subscription_id
  end

  test "cancel_subscription cancels a subscription" do
    new_mandate = prepare_mandate()

    params = %{
      subscriptions: %{
        amount: "2500",
        currency: "GBP",
        name: "Test Subscription",
        interval_unit: "monthly",
        day_of_month:  "1",
        links: %{mandate: new_mandate["id"]}
      }
    }

    {:ok, %{"subscriptions" => new_subscription}} = Gocardless.Client.create_subscription(params)
    {:ok, %{"subscriptions" => cancelled_subscription}} = Gocardless.Client.cancel_subscription(new_subscription["id"])

    assert cancelled_subscription["status"] == "cancelled"
  end

  defp get_last_subscription_id do
    {:ok, %{"subscriptions" => subscriptions}} = Gocardless.Client.list_subscriptions(%{limit: 1})

    {:ok, subscription} = Enum.fetch(subscriptions, -1)

    subscription["id"]
  end

  defp prepare_mandate do
    params = %{
      creditors: %{name: "Test Creditor"}
    }
    {:ok, %{"creditors" => new_creditor}} = Gocardless.Client.create_creditor(params)

    params = %{
      customers: %{
        email: "name@email.com",
        given_name: "Firstname",
        family_name: "Lastname",
        country_code: "GB"
      }
    }

    {:ok, %{"customers" => new_customer}} = Gocardless.Client.create_customer(params)

    params = %{
      customer_bank_accounts: %{
        account_holder_name: "FirstName LastName",
        account_number: "55779911",
        branch_code: "200000",
        country_code: "GB",
        links: %{customer: new_customer["id"]}
      }
    }

    {:ok, %{"customer_bank_accounts" => new_customer_bank_account}} = Gocardless.Client.create_customer_bank_account(params)

    params = %{
      mandates: %{
        scheme: "bacs",
        links: %{customer_bank_account: new_customer_bank_account["id"], creditor: new_creditor["id"]}
      }
    }
    {:ok, %{"mandates" => new_mandate}} = Gocardless.Client.create_mandate(params)
    new_mandate
  end
end
