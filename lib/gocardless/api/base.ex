defmodule Gocardless.Api.Base do
  @api_base Application.fetch_env!(:gocardless, :api_base)
  @api_version Application.fetch_env!(:gocardless, :api_version)
  @access_token Application.fetch_env!(:gocardless, :access_token)

  def request(:get, path) do
    path
    |> api_url
    |> HTTPotion.get(headers())
  end

  def request(:post, path, body) do
    hdrs = [body: Poison.encode!(body)] 
    |> headers

    path
    |> api_url
    |> HTTPotion.post(hdrs)
  end

  def request(:put, path, body) do
    hdrs = [body: Poison.encode!(body)] 
    |> headers

    path
    |> api_url
    |> HTTPotion.put(hdrs)
  end

  def decode_json(resp_map) do
    body = resp_map.body
    |> Poison.decode!

    case resp_map.status_code do
      200 -> {:ok, body}
      x when x > 200 -> {:error, body}
    end
  end

  defp api_url(url) do
    @api_base <> url
  end

  defp headers, do: headers([])
  defp headers(body) do
    [headers: ["Authorization": "Bearer #{@access_token}",
               "GoCardless-Version": @api_version,
               "Accepts": "application/json",
               "Content-Type": "application/json"]] ++ body
  end
end