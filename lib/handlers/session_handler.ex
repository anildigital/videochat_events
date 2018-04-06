defmodule SessionHandler do
  use GenEvent

  def handle_event(event, parent) do
    IO.inspect("Event received is in SessionHandler ": event)
    {:ok, parent}
  end
end
