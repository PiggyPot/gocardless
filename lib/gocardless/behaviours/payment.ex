defmodule Gocardless.Behaviour.Payment do
  @callback list_payments(map()) :: tuple()
  @callback get_payment(String.t) :: tuple()
  @callback create_payment(map()) :: tuple()
  @callback update_payment(String.t, map()) :: tuple()
  @callback cancel_payment(String.t, map()) :: tuple()
  @callback retry_payment(String.t, map()) :: tuple()
end