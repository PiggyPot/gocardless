defmodule Gocardless.API.Base do
  @api_base Application.fetch_env!(:gocardless, :api_base)

  def request(:get, path) do
  end

  def request(:post, path, body) do
  end

  def request(:put, path, body) do
  end

  def decode_json(resp_map) do
  end

  defp api_url(url) do
  end
end