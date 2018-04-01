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
    
    agent = Agent.start(fn -> session_info end)
    
    agent
  end
  
  def attach_plugin(session, plugin_name) do
    {:ok, event_manager} = GenEvent.start_link}
    
    plugin = %Plugin{
              event_manager: event_manager,
              room_number: room_number
            }    
  end
end