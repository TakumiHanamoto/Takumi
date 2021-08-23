class RequestersController < ApplicationController
  before_action :authenticate_requester!, :only => [:show]
  def index
    @requesters=Requester.all
  end

  def show
    @requester=Requester.find(params[:id])
    @currentUserEntry=Entry.where(requester_id: current_requester.id)
    @userEntry=Entry.where(requester_id: @requester.id)
    if @requester.id == current_requester.id
    else
      @currentRequesterEntry.each do |cr|
        @requesterEntry.each do |r|
          if cr.room_id == r.room_id then
            @isRoom = true
            @roomId = cr.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end
