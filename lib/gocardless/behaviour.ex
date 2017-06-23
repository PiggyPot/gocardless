defmodule Gocardless.Behaviour do
  @callback list_customers(map()) :: tuple()
  @callback get_customer(String.t) :: tuple()
  @callback create_customer(map()) :: tuple()
  @callback update_customer(String.t, map()) :: tuple()
end