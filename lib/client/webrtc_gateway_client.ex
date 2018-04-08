defmodule WebrtcGatewayClient do
  def init_room(room_name) do
    {:ok, session} = Session.start("ui_room")
    {:ok, plugin} = session |> Session.attach_plugin("videoroom")

    start_sending_events(session, plugin)
    {session, plugin}
  end

  def start_sending_events(session, plugin) do
    session_info = Agent.get(session, & &1)
    :timer.apply_interval(4000, __MODULE__, :send_events, [
      session_info.event_manager
      ])

    plugin_info = Agent.get(plugin, & &1)
    :timer.apply_interval(2000, __MODULE__, :send_events, [
      plugin_info.event_manager
      ])
  end

  def send_events(event_manager) do
    GenEvent.notify(event_manager, {})
  end
end
