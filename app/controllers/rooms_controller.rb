class RoomsController < ApplicationController

def create
    if requester_signed_in?
        @room = Room.new(room_student_params)
        @room.requester_id = current_requester.id
    elsif student_signed_in?
        @room = Room.new(room_requester_params)
        @room.student_id = current_student.id
    else
        redirect_to "/"
    end

    if @room.save
        redirect_to :action => "show", :id => @room.id
    else
        redirect_to "/"
    end
end

def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
    if requester_signed_in?
        if @room.requester_id == current_requester.id
            @student = @room.student_id
        else
            redirect_to "/"
        end
    elsif student_signed_in?
        if @room.student.id == current_student.id
            @requester = @room.requester
        else
            redirect_to "/"
        end
    else
        redirect_to "/"
    end
end

    private
    def room_student_params
        params.require(:room).permit(:student_id)
    end
    def room_requester_params
        params.require(:room).permit(:requester_id)
    end
end

