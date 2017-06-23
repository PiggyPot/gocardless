# Gocardless

Elixir wrapper for the GoCardless API.

## Installation

1. Add `gocardless` to your list of dependencies in mix.exs:

```elixir
def deps do
  [{:gocardless, "~> 0.1.0"}]
end
```

2. Ensure `gocardless` is started before your application:

```elixir
def application do
  [applications: [:gocardless]]
end
```

## Docs

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
