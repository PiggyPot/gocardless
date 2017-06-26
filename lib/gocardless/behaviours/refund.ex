defmodule Gocardless.Behaviour.Refund do
  @doc """
  Lists Refunds from GoCardless

  ## Examples

      iex> Gocardless.Client.list_refunds
  """
  @callback list_refunds(map()) :: tuple()

  @doc """
  Gets a Refund based on their ID in GoCardless

  ## Examples

      iex> Gocardless.Client.get_refund("BA000999999998")
  """
  @callback get_refund(String.t) :: tuple()

  @doc """
  Creates a new Refund

  ## Examples

      iex> params = %{
        refunds: %{
          amount: 100,
          total_amount_confirmation: 10000,
          reference: "Refunding this partial payment",
          links: %{
            payment: "PM0004Y766V22R"
          }
        }
      }
      iex> Gocardless.Client.create_refund(params)
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
      iex> Gocardless.Client.update_refund("BA000999999998", params)
  """
  @callback update_refund(String.t, map()) :: tuple()
end
