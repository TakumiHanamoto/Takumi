class MessagesController < ApplicationController
def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    if requester_signed_in?
        @message.is_requester = true
    elsif student_signed_in?
        @message.is_requester = false
    end
    @message.room_id = @room.id
    if @message.save!
        redirect_to room_url(@room)
    else
        redirect_to room_url(@room)
    end
end

private
    def message_params
        params.require(:message).permit(:content)
    end
end
