defmodule SessionTest do
  use ExUnit.Case
  
  test "session start should start a session" do
    {:ok, session} = Session.start('foo')
  end
  
  test "assert session returns a valid agent with session info" do
    {:ok, session} = Session.start('foo')
    
    room_name = Agent.get(session, & &1.room_name)
    assert 'foo' == room_name 
  end

 #test "assert session start returns agent with event manager info in it" do
  # {:ok, session} = Session.start('foo')
    
  #  event_manager = Agent.get(session, & &1.event_manager)
    
  #  assert 'foo' == room_name 
  #end
  
  #test "if we can get events on handler for an event manager" do
  #  {:ok, manager} = GenEvent.start_link
    
  #  GenEvent.add_handler(manager, Forwarder, self())
    
  #  GenEvent.sync_notify(manager, {:hello, :world})
    
    #assert_receive {:hello, :world}
  #end

  test "assert session attach plugin adds plugin to session handles" do
    {:ok, session} = Session.start('foo')
    {:ok, plugin_pid} = Session.attach_plugin(session, "plugin.videoroom")
    handles = Agent.get(session, & &1.handles)
    IO.inspect(handles: handles)
  end

end  
