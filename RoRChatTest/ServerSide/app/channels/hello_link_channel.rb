class HelloLinkChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "hello_link_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def say_hello(msg_from_client)
    ActionCable.server.broadcast "hello_link_channel", to_client_message: "this is a message from server (reponse to message from client \"#{msg_from_client['hello_msg_to_server']}\")"
  end
end
