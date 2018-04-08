defmodule Channel do
  def start_videochat(room_name) do
    {session, plugin} = WebrtcGatewayClient.init_room(room_name)
    Session.add_handler(session, SessionHandler, nil)
    Plugin.add_handler(session, VideochatHandler, nil)
  end
end
