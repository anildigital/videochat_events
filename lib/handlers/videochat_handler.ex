
defmodule VideochatHandler do
  use GenEvent

  def handle_event(event, parent) do
    IO.inspect("Event received is ": event)
    {:ok, parent}
  end
end
