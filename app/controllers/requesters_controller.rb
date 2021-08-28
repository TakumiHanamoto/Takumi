class RequestersController < ApplicationController

  before_action :authenticate_requester!, only: [:create, :show]

  def index
    @requesters=Requester.all
    @currentEntries = current_requester.entries
  end

  def show
    @requester=Requester.find(params[:id])
    @currentRequesterEntry=Entry.where(requester_id: current_requester.id)
    @requesterEntry=Entry.where(requester_id: @requester_id)
    unless @requester.id == current_requester.id
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
