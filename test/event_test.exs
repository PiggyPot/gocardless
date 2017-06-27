defmodule EventTest do
  use ExUnit.Case

  test "list_events/1 returns response formated as required" do
    prepare_test()
    {:ok, %{"events" => events}} = Gocardless.Client.list_events
    assert is_list(events)
  end

  test "get_event/1 returns a event" do
    prepare_test()

    {:ok, %{"events" => events}} = Gocardless.Client.list_events

    {:ok, event} = Enum.fetch(events, -1)

    {:ok, %{"events" => retrieved_event}} = Gocardless.Client.get_event(event["id"])

    assert retrieved_event["id"] == event["id"]
  end

  defp prepare_test do
    params = %{
      creditors: %{name: "Test Creditor"}
    }
    Gocardless.Client.create_creditor(params)
  end
end
