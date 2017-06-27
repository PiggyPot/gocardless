defmodule Gocardless.Behaviour.Subscription do
  @moduledoc """
  Defines the behaviour for Subscriptions
  """
  @doc """
  Lists Subscriptions from GoCardless

  ## Examples

      iex> Gocardless.Client.list_subscriptions
      {:ok,
       %{"meta" => %{"cursors" => %{"after" => nil, "before" => nil}, "limit" => 50},
         "subscriptions" => [%{"amount" => 2500,
            "created_at" => "2017-06-26T11:03:27.037Z", "currency" => "GBP",
            "day_of_month" => 1, "end_date" => nil, "id" => "SB000999999998",
            "interval" => 1, "interval_unit" => "monthly",
            "links" => %{"mandate" => "MD000999999998"},
            "metadata" => %{"order_no" => "ABCD1234"}, "month" => nil,
            "name" => "Monthly Magazine", "payment_reference" => nil,
            "start_date" => "2017-07-03", "status" => "active",
            "upcoming_payments" => [%{"amount" => 2500,
               "charge_date" => "2017-07-03"},
             %{"amount" => 2500, "charge_date" => "2017-08-01"},
             %{"amount" => 2500, "charge_date" => "2017-09-01"},
             %{"amount" => 2500, "charge_date" => "2017-10-02"},
             %{"amount" => 2500, "charge_date" => "2017-11-01"},
             %{"amount" => 2500, "charge_date" => "2017-12-01"},
             %{"amount" => 2500, "charge_date" => "2018-01-02"},
             %{"amount" => 2500, "charge_date" => "2018-02-01"},
             %{"amount" => 2500, "charge_date" => "2018-03-01"},
             %{"amount" => 2500, "charge_date" => "2018-04-03"}]}]}}
  """
  @callback list_subscriptions(map()) :: tuple()

  @doc """
  Gets a Subscription based on their ID in GoCardless

  ## Examples

      iex> Gocardless.Client.get_subscription("SB000999999998")
      {:ok,
       %{"subscriptions" => %{"amount" => 2500,
           "created_at" => "2017-06-26T11:03:27.037Z", "currency" => "GBP",
           "day_of_month" => 1, "end_date" => nil, "id" => "SB000999999998",
           "interval" => 1, "interval_unit" => "monthly",
           "links" => %{"mandate" => "MD000999999998"},
           "metadata" => %{"order_no" => "ABCD1234"}, "month" => nil,
           "name" => "Monthly Magazine", "payment_reference" => nil,
           "start_date" => "2017-07-03", "status" => "active",
           "upcoming_payments" => [%{"amount" => 2500, "charge_date" => "2017-07-03"},
            %{"amount" => 2500, "charge_date" => "2017-08-01"},
            %{"amount" => 2500, "charge_date" => "2017-09-01"},
            %{"amount" => 2500, "charge_date" => "2017-10-02"},
            %{"amount" => 2500, "charge_date" => "2017-11-01"},
            %{"amount" => 2500, "charge_date" => "2017-12-01"},
            %{"amount" => 2500, "charge_date" => "2018-01-02"},
            %{"amount" => 2500, "charge_date" => "2018-02-01"},
            %{"amount" => 2500, "charge_date" => "2018-03-01"},
            %{"amount" => 2500, "charge_date" => "2018-04-03"}]}}}
  """
  @callback get_subscription(String.t) :: tuple()

  @doc """
  Creates a new Subscription

  ## Examples

      iex> params = %{
        subscriptions: %{
          amount: "2500",
          currency: "GBP",
          name: "Monthly Magazine",
          interval_unit: "monthly",
          day_of_month:  "1",
          metadata: %{
            "order_no": "ABCD1234"
          },
          links: %{
            mandate: "MD000999999998"
          }
        }
      }
      iex> Gocardless.Client.create_subscription(params)
      {:ok,
       %{"subscriptions" => %{"amount" => 2500,
           "created_at" => "2017-06-26T11:03:27.037Z", "currency" => "GBP",
           "day_of_month" => 1, "end_date" => nil, "id" => "SB000999999998",
           "interval" => 1, "interval_unit" => "monthly",
           "links" => %{"mandate" => "MD000999999998"},
           "metadata" => %{"order_no" => "ABCD1234"}, "month" => nil,
           "name" => "Monthly Magazine", "payment_reference" => nil,
           "start_date" => "2017-07-03", "status" => "active",
           "upcoming_payments" => [%{"amount" => 2500, "charge_date" => "2017-07-03"},
            %{"amount" => 2500, "charge_date" => "2017-08-01"},
            %{"amount" => 2500, "charge_date" => "2017-09-01"},
            %{"amount" => 2500, "charge_date" => "2017-10-02"},
            %{"amount" => 2500, "charge_date" => "2017-11-01"},
            %{"amount" => 2500, "charge_date" => "2017-12-01"},
            %{"amount" => 2500, "charge_date" => "2018-01-02"},
            %{"amount" => 2500, "charge_date" => "2018-02-01"},
            %{"amount" => 2500, "charge_date" => "2018-03-01"},
            %{"amount" => 2500, "charge_date" => "2018-04-03"}]}}}
  """
  @callback create_subscription(map()) :: tuple()

  @doc """
  Updates a Subscription in GoCardless.

  ## Examples

      iex> params = %{
        subscriptions: %{
          name: "Updated Name"
        }
      }
      iex> Gocardless.Client.update_subscription("SB000999999998", params)
      {:ok,
       %{"subscriptions" => %{"amount" => 2500,
           "created_at" => "2017-06-26T11:03:27.037Z", "currency" => "GBP",
           "day_of_month" => 1, "end_date" => nil, "id" => "SB000999999998",
           "interval" => 1, "interval_unit" => "monthly",
           "links" => %{"mandate" => "MD000999999998"},
           "metadata" => %{"order_no" => "ABCD1234"}, "month" => nil,
           "name" => "Updated Name", "payment_reference" => nil,
           "start_date" => "2017-07-03", "status" => "active",
           "upcoming_payments" => [%{"amount" => 2500, "charge_date" => "2017-07-03"},
            %{"amount" => 2500, "charge_date" => "2017-08-01"},
            %{"amount" => 2500, "charge_date" => "2017-09-01"},
            %{"amount" => 2500, "charge_date" => "2017-10-02"},
            %{"amount" => 2500, "charge_date" => "2017-11-01"},
            %{"amount" => 2500, "charge_date" => "2017-12-01"},
            %{"amount" => 2500, "charge_date" => "2018-01-02"},
            %{"amount" => 2500, "charge_date" => "2018-02-01"},
            %{"amount" => 2500, "charge_date" => "2018-03-01"},
            %{"amount" => 2500, "charge_date" => "2018-04-03"}]}}}
  """
  @callback update_subscription(String.t, map()) :: tuple()

  @doc """

  ## Examples

      iex> Gocardless.Client.cancel_subscription("SB000999999998")
      {:ok,
       %{"subscriptions" => %{"amount" => 2500,
           "created_at" => "2017-06-26T11:03:27.037Z", "currency" => "GBP",
           "day_of_month" => 1, "end_date" => nil, "id" => "SB000999999998",
           "interval" => 1, "interval_unit" => "monthly",
           "links" => %{"mandate" => "MD000999999998"},
           "metadata" => %{"order_no" => "ABCD1234"}, "month" => nil,
           "name" => "Updated Name", "payment_reference" => nil,
           "start_date" => "2017-07-03", "status" => "cancelled",
           "upcoming_payments" => []}}}
  """
  @callback cancel_subscription(String.t) :: tuple()
end
