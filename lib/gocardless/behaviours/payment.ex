defmodule Gocardless.Behaviour.Payment do
  @doc """
  Lists all payments

  ## Examples

      iex> Gocardless.Client.list_payments
      {:ok,
      %{"meta" => %{"cursors" => %{"after" => nil, "before" => nil}, "limit" => 50},
        "payments" => [%{"amount" => 100, "amount_refunded" => 0,
            "charge_date" => "2017-06-30", "created_at" => "2017-06-23T15:27:18.656Z",
            "currency" => "GBP", "description" => nil, "id" => "PM000099999999",
            "links" => %{"creditor" => "CR000099999999",
              "mandate" => "MD000099999999"}, "metadata" => %{}, "reference" => nil,
            "status" => "pending_submission"}]}}

      iex> Gocardless.Client.list_payments(%{"created_at[gt]" => "2017-06-22T17:18:06.000Z"})
      {:ok,
      %{"meta" => %{"cursors" => %{"after" => nil, "before" => nil}, "limit" => 50},
        "payments" => [%{"amount" => 100, "amount_refunded" => 0,
            "charge_date" => "2017-06-30", "created_at" => "2017-06-23T15:27:18.656Z",
            "currency" => "GBP", "description" => nil, "id" => "PM000099999999",
            "links" => %{"creditor" => "CR000099999999",
              "mandate" => "MD000099999999"}, "metadata" => %{}, "reference" => nil,
            "status" => "pending_submission"}]}}
  """
  @callback list_payments(map()) :: tuple()

  @doc """
  Gets an individual payment by ID

  ## Examples

      iex> Gocardless.Client.get_payment("PM000099999999")
      {:ok,
      %{"payments" => %{"amount" => 100, "amount_refunded" => 0,
          "charge_date" => "2017-06-30", "created_at" => "2017-06-23T15:27:18.656Z",
          "currency" => "GBP", "description" => nil, "id" => "PM000099999999",
          "links" => %{"creditor" => "CR000099999999",
            "mandate" => "MD000099999999"}, "metadata" => %{}, "reference" => nil,
          "status" => "pending_submission"}}}
  """
  @callback get_payment(String.t) :: tuple()

  @doc """
  Creates a new Payment

  ## Examples
      iex> params = %{
        payments: %{
          amount: 100,
          currency: "GBP",
          charge_date: "2017-06-30",
          links: %{
            mandate: "MD000099999999"
          }
        }
      }
      iex> Gocardless.Client.create_payment(params)
      {:ok,
      %{"payments" => %{"amount" => 100, "amount_refunded" => 0,
          "charge_date" => "2017-06-30", "created_at" => "2017-06-23T15:27:18.656Z",
          "currency" => "GBP", "description" => nil, "id" => "PM000099999999",
          "links" => %{"creditor" => "CR000099999999",
            "mandate" => "MD000099999999"}, "metadata" => %{}, "reference" => nil,
          "status" => "pending_submission"}}}
  """
  @callback create_payment(map()) :: tuple()

  @doc """
  Updates a Payment metadata based by ID.
  Only the metadata parameter is allowed.

  ## Examples

      iex> params = %{
        payments: %{
          metadata: %{
            db_id: "1234"
          }
        }
      }
      iex> Gocardless.Client.update_payment("PM000099999999", mtd)
      {:ok,
      %{"payments" => %{"amount" => 100, "amount_refunded" => 0,
          "charge_date" => "2017-06-30", "created_at" => "2017-06-23T15:27:18.656Z",
          "currency" => "GBP", "description" => nil, "id" => "PM000099999999",
          "links" => %{"creditor" => "CR000099999999",
            "mandate" => "MD000099999999"}, "metadata" => %{"db_id" => "1234"},
          "reference" => nil, "status" => "pending_submission"}}}
  """
  @callback update_payment(String.t, map()) :: tuple()

  @doc """
  Cancels the payment if it has not already been
  submitted to the banks.

  ## Examples

      iex> Gocardless.Client.cancel_payment("PM000099999999")
      {:ok,
      %{"payments" => %{"amount" => 100, "amount_refunded" => 0,
          "charge_date" => "2017-06-30", "created_at" => "2017-06-23T15:27:18.656Z",
          "currency" => "GBP", "description" => nil, "id" => "PM000099999999",
          "links" => %{"creditor" => "CR000099999999",
            "mandate" => "MD000099999999"}, "metadata" => %{"db_id" => "1234"},
          "reference" => nil, "status" => "cancelled"}}}

  """
  @callback cancel_payment(String.t, map()) :: tuple()

  @doc """
  Retries a failed payment if the underlying mandate
  is active.

  ## Examples

      iex> Gocardless.Client.retry_payment("PM000099999999")
  """
  @callback retry_payment(String.t, map()) :: tuple()
end
