class RoomsController < ApplicationController

def index
    @rooms = Room.all
    @entries = Entry.all
    @users = User.all
end

def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :requester_id => current_requester.id)
    @entry2 = Entry.create(params.require(:entry).permit(:requester_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
end

def show
    @room = Room.find(params[:id])
    if Entry.where(:requester_id => current_requester.id, :room_id => @room.id).present? or Entry.where(:student_id => current_student.id, :room_id => @room.id).present?
        @messages = @room.messages
        @message = Message.new
        @entries = @room.entries
    else
        redirect_back(fallback_location: root_path)
    end
end

end

