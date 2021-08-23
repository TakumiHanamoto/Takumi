class MessagesController < ApplicationController
    before_action :authenticate_requester!, :only => [:create]
    before_action :authenticate_student!, :only => [:create]

def create
    if Entry.where(:requester_id => current_requester.id, :room_id => params[:message][:room_id]).present?
        @message = Message.create(params.require(:message).permit(:requester_id, :content, :room_id).merge(:requester_id => current_requester.id))
        redirect_to "/rooms/#{@message.room_id}"
    elsif Entry.where(:student_id => current_student.id, :room_id => params[:message][:room_id]).present?
        @message = Message.create(params.require(:message).permit(:student_id, :content, :room_id).merge(:student_id => current_student.id))
        redirect_to "/rooms/#{@message.room_id}"
    else
        redirect_back(fallback_location: root_path)
    end
end
end
