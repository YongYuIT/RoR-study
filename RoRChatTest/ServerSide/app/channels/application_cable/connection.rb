module ApplicationCable
  class Connection < ActionCable::Connection::Base
    def connect
      logger.info "yuyong---->" +cookies[:userID]
    end
  end
end
