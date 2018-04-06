defmodule Plugin do
  defstruct [
    :event_manager
  ]

  def add_handler(plugin, handler, args),
    do: Agent.get(plugin, &GenEvent.add_handler(&1.event_manager, handler, args))
end
