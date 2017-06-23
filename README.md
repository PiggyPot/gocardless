# Gocardless

[![Hex pm](http://img.shields.io/hexpm/v/gocardless.svg?style=flat)](https://hex.pm/packages/gocardless)

Elixir wrapper for the GoCardless API.

## Installation

1. Add `gocardless` to your list of dependencies in mix.exs:

```elixir
def deps do
  [{:gocardless, "~> 0.1.1"}]
end
```

2. Ensure `gocardless` is started before your application:

```elixir
def application do
  [applications: [:gocardless]]
end
```

3. Add configuration to your app:

```elixir
config :gocardless,
  api_base: "https://api-sandbox.gocardless.com/",
  api_version: "2015-07-06",
  access_token: "<your-token>"
```

4. Example usage:

```elixir
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
```

## For more information, see the Hex docs

You can read the docs [here](https://hexdocs.pm/gocardless)

## Implementation state

These are the priorities for us right now. If you want anything else feel free to add a pull request.

- [x] Customers
  - [x] List
  - [x] Get
  - [x] Create
  - [x] Update
- [x] Mandates
  - [x] List
  - [x] Get
  - [x] Create
  - [x] Update
  - [x] Cancel
  - [x] Reinstate
- [x] CustomerBankAccounts
  - [x] List
  - [x] Get
  - [x] Create
  - [x] Update
  - [x] Disable
- [x] Payments
  - [x] List
  - [x] Get
  - [x] Create
  - [x] Update
  - [x] Cancel
  - [x] Retry
