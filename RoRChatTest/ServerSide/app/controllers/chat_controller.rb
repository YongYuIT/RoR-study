class ChatController < ApplicationController
  def conn_test
    #分配userID
    cookies[:userID]=Time.new.to_i.to_s
  end
end
