defmodule Session do
  defstruct [
    :event_manager,
    :room_name,
    handles: %{}
  ]

  def start(room_name) do 
    {:ok, event_manager} = GenEvent.start_link()
    
    session_info = %Session{
       room_name: room_name,
       event_manager: event_manager
    }
    
    Agent.start(fn -> session_info end)
  end
  
  def attach_plugin(session, plugin_name) do
    {:ok, event_manager} = GenEvent.start_link()
    
    plugin_info = %Plugin{event_manager: event_manager }

    {:ok, plugin_agent} = Agent.start(fn -> plugin_info end)
    
    Agent.update(session, fn session_info ->
      new_handles = Map.put(session_info.handles, plugin_name, plugin_agent ) 
      %{session_info | handles: new_handles}
    end)

    {:ok, plugin_agent}
  end

  def add_handler(session, handler, args),
    do: Agent.get(session, &GenEvent.add_handler(&1.event_manager, handler, args))
end
