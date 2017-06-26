defmodule Gocardless.Behaviour.RedirectFlow do
  @doc """
  Gets a Redirect Flow based on their ID in GoCardless

  ## Examples

      iex> Gocardless.Client.get_redirect_flow("RE000099999999999999999999999999")
      {:ok,
       %{"redirect_flows" => %{"created_at" => "2017-06-26T14:48:26.874Z",
           "description" => nil, "id" => "RE000099999999999999999999999999",
           "links" => %{"creditor" => "CR000999999998"},
           "redirect_url" => "https://pay-sandbox.gocardless.com/flow/RE000099999999999999999999999999",
           "scheme" => nil, "session_token" => "SESS_0000000000000000",
           "success_redirect_url" => "https://mysite.com/redirect_path"}}}
  """
  @callback get_redirect_flow(String.t) :: tuple()

  @doc """
  Creates a new Redirect Flow

  ## Examples

      iex> params = %{
        redirect_flows: %{
          session_token: "SESS_0000000000000000",
          success_redirect_url: "https://mysite.com/redirect_path"
        }
      }
      iex> Gocardless.Client.create_redirect_flow(params)
      {:ok,
       %{"redirect_flows" => %{"created_at" => "2017-06-26T14:48:26.874Z",
           "description" => nil, "id" => "RE000099999999999999999999999999",
           "links" => %{"creditor" => "CR000999999998"},
           "redirect_url" => "https://pay-sandbox.gocardless.com/flow/RE000099999999999999999999999999",
           "scheme" => nil, "session_token" => "SESS_0000000000000000",
           "success_redirect_url" => "https://mysite.com/redirect_path"}}}
  """
  @callback create_redirect_flow(map()) :: tuple()

  @doc """

  Completes a Redirect Flow

  ## Examples

      iex> params = %{data: %{session_token: "SESS_0000000000000000"}}
      iex> Gocardless.Client.complete_redirect_flow("RE000099999999999999999999999999", params)
      {:ok,
         %{"redirect_flows" => %{"created_at" => "2017-06-26T14:48:26.874Z",
             "description" => nil, "id" => "RE000099999999999999999999999999",
             "links" => %{"creditor" => "CR000999999998",
               "customer" => "CU000999999998",
               "customer_bank_account" => "BA000999999998",
               "mandate" => "MD000999999998"}, "scheme" => nil,
             "session_token" => "SESS_0000000000000000",
             "success_redirect_url" => "https://mysite.com/redirect_path"}}}
  """
  @callback complete_redirect_flow(String.t, map()) :: tuple()
end
