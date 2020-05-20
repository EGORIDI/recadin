class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel",
                                    mod_message: message_render(message)
                                    # here we send a modified message to be rendered
                                    # by the chatroom_channel.js method "append" on
                                    # received.
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  # Here we re simply rendering a message partial, but there are so many "message"
  # in this code that I truly have to pay attention to understand where it means
  # the partial view called "message" that will reach "/views/messages/_message.html.erb"
  # or some other "message" such as the parameter passed here to the method or
  # the object in the "-message" partial or other.
  def message_render(message)
    render(partial: 'message', locals: {message: message})
  end

end
