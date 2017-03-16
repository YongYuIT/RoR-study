$users=[]
class SpecialLinkChannel < ApplicationCable::Channel
  def subscribed
    logger.info "yuyong---->subscribed-->"+params.to_s+"-->"+$users.to_s
    @userID = Time.new.to_i.to_s
    stream_for @userID
    $users.push(@userID)
  end

  def unsubscribed
    $users=$users-[@userID]
    logger.info "yuyong---->unsubscribed"+"-->"+$users.to_s
  end

  def s_say_hello(msg_from_client)
    logger.info "yuyong---->s_say_hello"
    to_user=[]
    $users.each{
      |item|
      if(item!=@userID)
        to_user.push(item)
      end
    }
    SpecialLinkChannel.broadcast_to(to_user,to_client_message: "this is a message from server (reponse to message from client \"#{msg_from_client['hello_msg_to_server']}\")")
  end
end
