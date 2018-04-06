defmodule WebrtcGatewayClient do
  def init_room(room_name) do
    {:ok, session} = Session.start("ui_room")
    {:ok, plugin} = session |> Session.attach_plugin("videoroom")

    {session, plugin}
  end
end
