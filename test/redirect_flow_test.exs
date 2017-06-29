defmodule RedirectFlowTest do
  use ExUnit.Case

  test "create_redirect_flow/1 creates a new Redirect Flow" do
    params = %{
      creditors: %{name: "Test Creditor"}
    }

    {:ok, %{"creditors" => new_creditor}} = Gocardless.Client.create_creditor(params)

    params = %{
      redirect_flows: %{
        session_token: "SESS_0000000000000000",
        success_redirect_url: "https://mysite.com/redirect_path",
        links: %{creditor: new_creditor["id"]}
      }
    }

    {:ok, %{"redirect_flows" => redirect_flow}} = Gocardless.Client.create_redirect_flow(params)

    assert redirect_flow["session_token"] == "SESS_0000000000000000"
  end

  test "get_redirect_flow/1 returns a Redirect Flow" do
    params = %{
      creditors: %{name: "Test Creditor"}
    }

    {:ok, %{"creditors" => new_creditor}} = Gocardless.Client.create_creditor(params)

    params = %{
      redirect_flows: %{
        session_token: "SESS_0000000000000000",
        success_redirect_url: "https://mysite.com/redirect_path",
        links: %{creditor: new_creditor["id"]}
      }
    }

    {:ok, %{"redirect_flows" => redirect_flow}} = Gocardless.Client.create_redirect_flow(params)

    {:ok, %{"redirect_flows" => retrieved_redirect_flow}} = Gocardless.Client.get_redirect_flow(redirect_flow["id"])

    assert retrieved_redirect_flow["id"] == redirect_flow["id"]
  end
end
