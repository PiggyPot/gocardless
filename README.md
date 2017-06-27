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

then...

```elixir
mix deps.get
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
      "given_name" => "Firstname", "id" => "CU0009999999", "language" => "en",
      "metadata" => %{}, "postal_code" => nil, "region" => nil,
      "swedish_identity_number" => nil}}}
```

## For more information, see the Hex docs

You can read the docs [here](https://hexdocs.pm/gocardless)

## Development Setup

If you are making changes to this codebase and want to test your code, you will need to copy the sample secret file.

```elixir
cp config/secret.sample.exs config/secret.exs
```

Then add your GoCardless token where the key is `access_token`.

## Implementation state

These resources still need to be implemented.

- [ ] Creditors
- [ ] Creditor Bank Accounts
- [ ] Events
- [ ] Payouts
- [ ] Redirect Flows
- [x] Refunds
- [ ] Subscriptions

These are other areas of the codebase that can be improved.

- [ ] Testing error cases
