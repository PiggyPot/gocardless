defmodule Gocardless.Behaviour do
  @moduledoc """
  Public API for Gocardless
  """

  @doc """
  Lists Customers from GoCardless

  ## Examples
      iex> Gocardless.Client.list_customers()
      {:ok,
      %{"customers" => [%{"address_line1" => nil, "address_line2" => nil,
          "address_line3" => nil, "city" => nil, "company_name" => nil,
          "country_code" => "GB", "created_at" => "2017-06-23T10:47:22.248Z",
          "email" => "name@email.com", "family_name" => "Lastname",
          "given_name" => "Firstname", "id" => "CU000999999997", "language" => "en",
          "metadata" => %{}, "postal_code" => nil, "region" => nil,
          "swedish_identity_number" => nil},
        %{"address_line1" => nil, "address_line2" => nil, "address_line3" => nil,
          "city" => nil, "company_name" => nil, "country_code" => "GB",
          "created_at" => "2017-06-22T17:11:04.112Z",
          "email" => "name@email.com", "family_name" => "Lastname2",
          "given_name" => "Firstname2", "id" => "CU000999999998", "language" => "en",
          "metadata" => %{}, "postal_code" => nil, "region" => nil,
          "swedish_identity_number" => nil}],
       "meta" => %{"cursors" => %{"after" => nil, "before" => nil}, "limit" => 50}}}

      iex> Gocardless.Client.list_customers(%{"created_at[gt]" => "2017-06-22T17:18:06.000Z"})
      {:ok,
       %{"customers" => [%{"address_line1" => nil, "address_line2" => nil,
            "address_line3" => nil, "city" => nil, "company_name" => nil,
            "country_code" => "GB", "created_at" => "2017-06-23T10:47:22.248Z",
            "email" => "name@email.com", "family_name" => "Lastname",
            "given_name" => "Firstname", "id" => "CU000999999997", "language" => "en",
            "metadata" => %{}, "postal_code" => nil, "region" => nil,
            "swedish_identity_number" => nil}],
         "meta" => %{"cursors" => %{"after" => nil, "before" => nil}, "limit" => 50}}}
  """
  @callback list_customers(map()) :: tuple()

  @doc """
  Gets a Customer based on their ID in GoCardless

  ## Examples

      iex> Gocardless.Client.get_customer("CU000999999998")
      {:ok,
       %{"customers" => %{"address_line1" => nil, "address_line2" => nil,
           "address_line3" => nil, "city" => nil, "company_name" => nil,
           "country_code" => "GB", "created_at" => "2017-06-23T10:47:22.248Z",
           "email" => "name@email.com", "family_name" => "Lastname",
           "given_name" => "Firstname", "id" => "CU000999999998", "language" => "en",
           "metadata" => %{}, "postal_code" => nil, "region" => nil,
           "swedish_identity_number" => nil}}}
  """
  @callback get_customer(String.t) :: tuple()

  @doc """
  Creates a new Customer

  ## Examples

      iex> params = %{
        email: "name@email.com",
        given_name: "Firstname",
        family_name: "Lastname",
        country_code: "GB"
      }
      iex> Gocardless.Client.create_customer(%{customers: params})
      {:ok,
        %{"customers" => %{"address_line1" => nil, "address_line2" => nil,
           "address_line3" => nil, "city" => nil, "company_name" => nil,
           "country_code" => "GB", "created_at" => "2017-06-23T13:04:45.459Z",
           "email" => "name@email.com", "family_name" => "Lastname",
           "given_name" => "Firstname", "id" => "CU000201WWT5RS", "language" => "en",
           "metadata" => %{}, "postal_code" => nil, "region" => nil,
           "swedish_identity_number" => nil}}}
  """
  @callback create_customer(map()) :: tuple()

  @doc """
  Updates a Customer based on their ID in GoCardless

  ## Examples

      iex> params = %{email: "new@email.com"}
      iex> Gocardless.Client.update_customer("CU000999999998", %{customers: params})
      {:ok,
       %{"customers" => %{"address_line1" => nil, "address_line2" => nil,
           "address_line3" => nil, "city" => nil, "company_name" => nil,
           "country_code" => "GB", "created_at" => "2017-06-23T13:04:45.459Z",
           "email" => "new@email.com", "family_name" => "Lastname",
           "given_name" => "Firstname", "id" => "CU000999999998", "language" => "en",
           "metadata" => %{}, "postal_code" => nil, "region" => nil,
           "swedish_identity_number" => nil}}}

  """
  @callback update_customer(String.t, map()) :: tuple()

  @doc """
  Lists Customer Bank Accounts from GoCardless

  ## Examples

      iex> Gocardless.Client.list_customer_bank_accounts
      {:ok,
      %{"customer_bank_accounts" => [%{"account_holder_name" => "FirstName LastName",
            "account_number_ending" => "11", "bank_name" => "BARCLAYS BANK PLC",
            "country_code" => "GB", "created_at" => "2017-06-23T13:37:09.967Z",
            "currency" => "GBP", "enabled" => true, "id" => "BA000999999998",
            "links" => %{"customer" => "CU000999999998"},
            "metadata" => %{"account_holder_name" => "FirstName LastName"}}],
        "meta" => %{"cursors" => %{"after" => nil, "before" => nil}, "limit" => 50}}}
  """
  @callback list_customer_bank_accounts(map()) :: tuple()  
  
  @doc """
  Gets a Customer Bank Account based on their ID in GoCardless

  ## Examples

      iex> Gocardless.Client.get_customer_bank_account("BA000999999998")
      {:ok,
      %{"customer_bank_accounts" => %{"account_holder_name" => "FirstName LastName",
          "account_number_ending" => "11", "bank_name" => "BARCLAYS BANK PLC",
          "country_code" => "GB", "created_at" => "2017-06-23T13:37:09.967Z",
          "currency" => "GBP", "enabled" => true, "id" => "BA000999999998",
          "links" => %{"customer" => "CU000999999998"},
          "metadata" => %{"account_holder_name" => "FirstName LastName"}}}}
  """
  @callback get_customer_bank_account(String.t) :: tuple()

  @doc """
  Creates a new Customer Bank Account

  ## Examples

      iex> params = %{
        customer_bank_accounts: %{
          account_holder_name: "FirstName LastName", 
          account_number: "55779911", 
          branch_code: "200000", 
          country_code: "GB", 
          links: %{
            customer: "CU000999999998"
          }
        }
      }
      iex> Gocardless.Client.create_customer_bank_account(params)
      {:ok,
      %{"customer_bank_accounts" => %{"account_holder_name" => "FirstName LastName",
          "account_number_ending" => "11", "bank_name" => "BARCLAYS BANK PLC",
          "country_code" => "GB", "created_at" => "2017-06-23T13:37:09.967Z",
          "currency" => "GBP", "enabled" => true, "id" => "BA000999999998",
          "links" => %{"customer" => "CU000999999998"}, "metadata" => %{}}}}
  """
  @callback create_customer_bank_account(map()) :: tuple()

  @doc """
  Updates a Customer Bank Account metadata based on their ID in GoCardless.
  Only the metadata parameter is allowed.

  ## Examples

      iex> params = %{
        customer_bank_accounts: %{
          metadata: %{
            db_id: "1234"
          }
        }
      }
      iex> Gocardless.Client.update_customer_bank_account("BA000999999998", params)
      {:ok,
      %{"customer_bank_accounts" => %{"account_holder_name" => "FirstName LastName",
          "account_number_ending" => "11", "bank_name" => "BARCLAYS BANK PLC",
          "country_code" => "GB", "created_at" => "2017-06-23T13:37:09.967Z",
          "currency" => "GBP", "enabled" => true, "id" => "BA000999999998",
          "links" => %{"customer" => "CU000999999998"},
          "metadata" => %{"db_id" => "1234"}}}}
  """
  @callback update_customer_bank_account(String.t, map()) :: tuple()

  @doc """

  ## Examples

      iex> Gocardless.Client.disable_customer_bank_account("BA000999999998")
      {:ok,
      %{"customer_bank_accounts" => %{"account_holder_name" => "FirstName LastName",
          "account_number_ending" => "11", "bank_name" => "BARCLAYS BANK PLC",
          "country_code" => "GB", "created_at" => "2017-06-23T13:37:09.967Z",
          "currency" => "GBP", "enabled" => false, "id" => "BA000999999998",
          "links" => %{"customer" => "CU000999999998"},
          "metadata" => %{}}}}
  """
  @callback disable_customer_bank_account(String.t) :: tuple()
end
