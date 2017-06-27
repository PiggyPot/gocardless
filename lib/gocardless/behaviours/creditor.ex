defmodule Gocardless.Behaviour.Creditor do
  @moduledoc """
  Lists Creditors from GoCardless

  ## Examples

  iex> Gocardless.Client.list_creditors
  {:ok, %{"creditors" => [%{"address_line1" => nil, "address_line2" => nil, "address_line3" => nil,
   "city" => nil, "country_code" => nil,
   "created_at" => "2017-06-27T08:52:52.655Z", "id" => "CR000099999999",
   "links" => %{}, "logo_url" => nil, "name" => "Test Creditor",
   "postal_code" => nil, "region" => nil,
   "scheme_identifiers" => [%{"address_line1" => "338-346 Goswell Road",
      "address_line2" => nil, "address_line3" => nil,
      "can_specify_mandate_reference" => false, "city" => "London",
      "country_code" => "GB", "currency" => "GBP",
      "email" => "help@gocardless.com", "minimum_advance_notice" => 3,
      "name" => "GoCardless", "phone_number" => "+40 20 1234 1234",
      "postal_code" => "EC1V 7LQ", "reference" => "275069", "region" => nil,
      "scheme" => "bacs"}], "verification_status" => "successful"}]}}
  """
  @callback list_creditors(map()) :: tuple()

  @doc """
  Gets a Creditor based on their ID in GoCardless

  ## Examples
  iex> Gocardless.Client.get_creditor("CR000099999999")
  {:ok, %{"address_line1" => nil, "address_line2" => nil, "address_line3" => nil,
   "city" => nil, "country_code" => nil,
   "created_at" => "2017-06-27T08:52:52.655Z", "id" => "CR000099999999",
   "links" => %{}, "logo_url" => nil, "name" => "Test Creditor",
   "postal_code" => nil, "region" => nil,
   "scheme_identifiers" => [%{"address_line1" => "338-346 Goswell Road",
      "address_line2" => nil, "address_line3" => nil,
      "can_specify_mandate_reference" => false, "city" => "London",
      "country_code" => "GB", "currency" => "GBP",
      "email" => "help@gocardless.com", "minimum_advance_notice" => 3,
      "name" => "GoCardless", "phone_number" => "+40 20 1234 1234",
      "postal_code" => "EC1V 7LQ", "reference" => "275069", "region" => nil,
      "scheme" => "bacs"}], "verification_status" => "successful"}}
  """
  @callback get_creditor(String.t) :: tuple()

  @doc """
  Creates a new Creditor

  ## Examples
  iex> params = %{
    creditors: %{
      name: "Test Creditor"
    }
  }
  iex> Gocardless.Client.create_creditor(params)
  {:ok, %{"address_line1" => nil, "address_line2" => nil, "address_line3" => nil,
   "city" => nil, "country_code" => nil,
   "created_at" => "2017-06-27T08:52:52.655Z", "id" => "CR000099999999",
   "links" => %{}, "logo_url" => nil, "name" => "Test Creditor",
   "postal_code" => nil, "region" => nil,
   "scheme_identifiers" => [%{"address_line1" => "338-346 Goswell Road",
      "address_line2" => nil, "address_line3" => nil,
      "can_specify_mandate_reference" => false, "city" => "London",
      "country_code" => "GB", "currency" => "GBP",
      "email" => "help@gocardless.com", "minimum_advance_notice" => 3,
      "name" => "GoCardless", "phone_number" => "+40 20 1234 1234",
      "postal_code" => "EC1V 7LQ", "reference" => "275069", "region" => nil,
      "scheme" => "bacs"}], "verification_status" => "successful"}}
  """
  @callback create_creditor(map()) :: tuple()

  @doc """
  Updates a Creditor based on their ID in GoCardless

  ## Examples

  iex> params = %{
    creditors: %{
      name: "Updated Creditor"
    }
  }
  iex> Gocardless.Client.update_creditor("CR000099999999", params)
  {:ok, %{"address_line1" => nil, "address_line2" => nil, "address_line3" => nil,
   "city" => nil, "country_code" => nil,
   "created_at" => "2017-06-27T08:52:52.655Z", "id" => "CR000099999999",
   "links" => %{}, "logo_url" => nil, "name" => "Test Creditor",
   "postal_code" => nil, "region" => nil,
   "scheme_identifiers" => [%{"address_line1" => "338-346 Goswell Road",
      "address_line2" => nil, "address_line3" => nil,
      "can_specify_mandate_reference" => false, "city" => "London",
      "country_code" => "GB", "currency" => "GBP",
      "email" => "help@gocardless.com", "minimum_advance_notice" => 3,
      "name" => "GoCardless", "phone_number" => "+40 20 1234 1234",
      "postal_code" => "EC1V 7LQ", "reference" => "275069", "region" => nil,
      "scheme" => "bacs"}], "verification_status" => "successful"}}
  """
  @callback update_creditor(String.t, map()) :: tuple()
end