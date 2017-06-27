defmodule Gocardless.Behaviour.Refund do
  @doc """
  Lists Refunds from GoCardless

  ## Examples

      iex> Gocardless.Client.list_refunds
      {:ok,
       %{"meta" => %{"cursors" => %{"after" => nil, "before" => nil}, "limit" => 50},
         "refunds" => [%{"amount" => 100, "created_at" => "2017-06-27T10:00:26.248Z",
            "currency" => "GBP", "id" => "RF000999999998",
            "links" => %{"payment" => "PM000999999998"}, "metadata" => %{},
            "reference" => "partial refund"}]}}
  """
  @callback list_refunds(map()) :: tuple()

  @doc """
  Gets a Refund based on their ID in GoCardless

  ## Examples

      iex> Gocardless.Client.get_refund("RF000999999998")
      {:ok,
       %{"refunds" => %{"amount" => 100, "created_at" => "2017-06-27T10:00:26.248Z",
           "currency" => "GBP", "id" => "RF000999999998",
           "links" => %{"payment" => "PM000999999998"}, "metadata" => %{},
           "reference" => "partial refund"}}}
  """
  @callback get_refund(String.t) :: tuple()

  @doc """
  Creates a new Refund

  ## Examples

      iex> params = %{
        refunds: %{
          amount: 100,
          total_amount_confirmation: 100,
          reference: "partial refund",
          links: %{
            payment: "PM000999999998"
          }
        }
      }
      iex> Gocardless.Client.create_refund(params)
      {:ok,
       %{"refunds" => %{"amount" => 100, "created_at" => "2017-06-27T10:00:26.248Z",
           "currency" => "GBP", "id" => "RF000999999998",
           "links" => %{"payment" => "PM000999999998"}, "metadata" => %{},
           "reference" => "partial refund"}}}
  """
  @callback create_refund(map()) :: tuple()

  @doc """
  Updates a Refund metadata based on their ID in GoCardless.
  Only the metadata parameter is allowed.

  ## Examples

      iex> params = %{
        refunds: %{
          metadata: %{
            db_id: "1234"
          }
        }
      }
      iex> Gocardless.Client.update_refund("RF000999999998", params)
      {:ok,
       %{"refunds" => %{"amount" => 100, "created_at" => "2017-06-27T10:00:26.248Z",
           "currency" => "GBP", "id" => "RF000999999998",
           "links" => %{"payment" => "PM000999999998"},
           "metadata" => %{"db_id" => "1234"}, "reference" => "partial refund"}}}
  """
  @callback update_refund(String.t, map()) :: tuple()
end
