defmodule Gocardless.Behaviour.Mandate do
  @moduledoc """
  Public Mandate API for Gocardless
  """

  @doc """
  Lists mandates from GoCardless

  ## Examples
      iex> Gocardless.Client.list_mandates()
      {:ok,
       %{"mandates" => [%{"created_at" => "2017-06-23T15:31:52.850Z",
            "id" => "MD000999999998",
            "links" => %{"creditor" => "CR000999999998",
              "customer" => "CU000999999998",
              "customer_bank_account" => "BA000999999998"}, "metadata" => %{},
            "next_possible_charge_date" => "2017-06-30",
            "payments_require_approval" => false, "reference" => "REF-REF",
            "scheme" => "bacs", "status" => "pending_submission"},
          %{"created_at" => "2017-06-23T15:29:20.872Z", "id" => "MD000999999997",
            "links" => %{"creditor" => "CR000999999998",
              "customer" => "CU000999999998",
              "customer_bank_account" => "BA000999999998"}, "metadata" => %{},
            "next_possible_charge_date" => "2017-06-30",
            "payments_require_approval" => false, "reference" => "REF-REF",
            "scheme" => "bacs", "status" => "pending_submission"},
          %{"created_at" => "2017-06-23T15:24:31.356Z", "id" => "MD000999999996",
            "links" => %{"creditor" => "CR000999999998",
              "customer" => "CU000999999998",
              "customer_bank_account" => "BA000999999998"}, "metadata" => %{},
            "next_possible_charge_date" => "2017-06-30",
            "payments_require_approval" => false, "reference" => "REF-REF",
            "scheme" => "bacs", "status" => "pending_submission"}],
         "meta" => %{"cursors" => %{"after" => nil, "before" => nil}, "limit" => 50}}}

      iex> Gocardless.Client.list_mandates(%{customer: "CU000999999999"})
      {:ok,
       %{"mandates" => [%{"created_at" => "2017-06-23T15:31:52.850Z",
            "id" => "MD000999999999",
            "links" => %{"creditor" => "CR000999999999",
              "customer" => "CU000999999999",
              "customer_bank_account" => "BA000999999999"}, "metadata" => %{},
            "next_possible_charge_date" => "2017-06-30",
            "payments_require_approval" => false, "reference" => "REF-REF",
            "scheme" => "bacs", "status" => "pending_submission"}],
        "meta" => %{"cursors" => %{"after" => nil, "before" => nil}, "limit" => 50}}}
  """
  @callback list_mandates(map()) :: tuple()

  @doc """
  Gets a mandate based on their ID in GoCardless

  ## Examples

      iex> Gocardless.Client.get_mandate("MD000999999998")
      {:ok,
       %{"mandates" => %{"created_at" => "2017-06-23T15:29:20.872Z",
           "id" => "MD000999999998",
           "links" => %{"creditor" => "CR000999999998",
             "customer" => "CU000999999998",
             "customer_bank_account" => "BA000999999998"}, "metadata" => %{},
           "next_possible_charge_date" => "2017-06-30",
           "payments_require_approval" => false, "reference" => "REF-REF",
           "scheme" => "bacs", "status" => "pending_submission"}}}
  """
  @callback get_mandate(String.t) :: tuple()

  @doc """
  Creates a new mandate

  ## Examples

      iex> params = %{
        scheme: "bacs",
        links: %{customer_bank_account: "BA000999999999"}
      }
      iex> Gocardless.Client.create_mandate(%{mandates: params})
      {:ok,
       %{"mandates" => %{"created_at" => "2017-06-23T15:29:20.872Z",
           "id" => "MD000999999999",
           "links" => %{"creditor" => "CR000999999999",
             "customer" => "CU000999999999",
             "customer_bank_account" => "BA000999999999"}, "metadata" => %{},
           "next_possible_charge_date" => "2017-06-30",
           "payments_require_approval" => false, "reference" => "REF-REF",
           "scheme" => "bacs", "status" => "pending_submission"}}}
  """
  @callback create_mandate(map()) :: tuple()

  @doc """
  Updates a mandate based on their ID in GoCardless

  ## Examples

      iex> params = %{
        mandates: %{
          metadata: %{
            db_id: "1234"
          }
        }
      }
      iex> Gocardless.Client.update_mandate("MD000999999999", params)
      {:ok,
       %{"mandates" => %{"created_at" => "2017-06-23T15:31:52.850Z",
           "id" => "MD000999999999",
           "links" => %{"creditor" => "CR000999999999",
             "customer" => "CU000999999999",
             "customer_bank_account" => "BA000999999999"},
           "metadata" => %{"db_id" => "1234"},
           "next_possible_charge_date" => "2017-06-30",
           "payments_require_approval" => false, "reference" => "REF-REF",
           "scheme" => "bacs", "status" => "pending_submission"}}}
  """
  @callback update_mandate(String.t, map()) :: tuple()

  @doc """
  Cancels a mandate based on their ID in GoCardless

  ## Examples

      iex> Gocardless.Client.cancel_mandate("MD000999999999")
      {:ok,
       %{"mandates" => %{"created_at" => "2017-06-23T15:31:52.850Z",
           "id" => "MD000999999999",
           "links" => %{"creditor" => "CR000999999999",
             "customer" => "CU000999999999",
             "customer_bank_account" => "BA000999999999"},
           "metadata" => %{}, "next_possible_charge_date" => nil,
           "payments_require_approval" => false, "reference" => "REF-REF",
           "scheme" => "bacs", "status" => "cancelled"}}}
  """
  @callback cancel_mandate(String.t) :: tuple()

  @doc """
  Reinstates a mandate based on their ID in GoCardless

  ## Examples

      iex> Gocardless.Client.reinstate_mandate("MD000999999999")
      {:ok,
       %{"mandates" => %{"created_at" => "2017-06-23T15:31:52.850Z",
           "id" => "MD000999999999",
           "links" => %{"creditor" => "CR000999999999",
             "customer" => "CU000999999999",
             "customer_bank_account" => "BA000999999999"},
           "metadata" => %{},
           "next_possible_charge_date" => "2017-06-30",
           "payments_require_approval" => false, "reference" => "REF-REF",
           "scheme" => "bacs", "status" => "pending_submission"}}}
  """
  @callback reinstate_mandate(String.t) :: tuple()

  @doc """
  Creates a new mandate preview

  ## Examples

      iex> params = %{
        links: %{mandate: "MD123"}
      }
      iex> Gocardless.Client.pdf_preview(%{params: params})
      {:ok, %{
        "mandate_pdfs" => %{
          "url" => "https://mandate-previews.gocardless.com/?token=lhulxcPEbT9v3W0QUpBOxhlGUSYEayQQ4VVrpO7YnUKRYynP5",
          "expires_at" => "2014-05-08T17:01:06.000Z"
        }}}
  """
  @callback pdf_preview(map()) :: tuple()
end
