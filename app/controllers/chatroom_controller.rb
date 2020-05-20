class ChatroomController < ApplicationController
  before_action :require_user
  def index
    @message = Message.new
    @messages = Message.custom_display
    #  update the index action to grab the messages in an instance variable
    # now updating Message.all to display only a handful of messages via custom_display.
  end
end
