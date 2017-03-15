class SpecialLinkChannel < ApplicationCable::Channel
  def subscribed
    logger.info "yuyong---->subscribed-->"+params.to_s
    @userID = Time.new.to_i.to_s
    stream_for @userID
  end

  def unsubscribed

  end

  def s_say_hello(msg_from_client)
    logger.info "yuyong---->s_say_hello"
    SpecialLinkChannel.broadcast_to(@userID,to_client_message: "this is a message from server (reponse to message from client \"#{msg_from_client['hello_msg_to_server']}\")")
  end
end
