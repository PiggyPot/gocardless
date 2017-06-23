defmodule Gocardless.Behaviour.Mandate do
  @moduledoc """
  Public Mandate API for Gocardless
  """

  @doc """
  Lists mandates from GoCardless

  ## Examples
      iex> Gocardless.Client.list_mandates()
      iex> Gocardless.Client.list_mandates(%{"created_at[gt]" => "2017-06-22T17:18:06.000Z"})
  """
  @callback list_mandates(map()) :: tuple()

  @doc """
  Gets a mandate based on their ID in GoCardless

  ## Examples

      iex> Gocardless.Client.get_mandate("CU000999999998")
  """
  @callback get_mandate(String.t) :: tuple()

  @doc """
  Creates a new mandate

  ## Examples

      iex> params = %{
        email: "name@email.com",
        given_name: "Firstname",
        family_name: "Lastname",
        country_code: "GB"
      }
      iex> Gocardless.Client.create_mandate(%{mandates: params})
  """
  @callback create_mandate(map()) :: tuple()

  @doc """
  Updates a mandate based on their ID in GoCardless

  ## Examples

      iex> params = %{email: "new@email.com"}
      iex> Gocardless.Client.update_mandate("CU000999999998", %{mandates: params})
  """
  @callback update_mandate(String.t, map()) :: tuple()

  @doc """
  Cancels a mandate based on their ID in GoCardless

  ## Examples

      iex> Gocardless.Client.cancel_mandate("CU000999999998")
  """
  @callback cancel_mandate(String.t) :: tuple()

  @doc """
  Reinstates a mandate based on their ID in GoCardless

  ## Examples

      iex> Gocardless.Client.reinstate_mandate("CU000999999998")
  """
  @callback reinstate_mandate(String.t) :: tuple()
end
