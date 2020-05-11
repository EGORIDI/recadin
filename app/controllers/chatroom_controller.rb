class ChatroomController < ApplicationController
  before_action :require_user
  def index
    @messages = Message.all
    #  update the index action to grab the messages in an instance variable
  end
end
