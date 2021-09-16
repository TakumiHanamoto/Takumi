class RequestersController < ApplicationController

  before_action :authenticate_requester!, only: [:create, :show]

  def index
    @requesters=Requester.all
  end

  def show
    @requester=Requester.find(params[:id])
  end
end
