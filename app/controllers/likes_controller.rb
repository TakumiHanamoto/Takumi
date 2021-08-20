class LikesController < ApplicationController

    def create
        like = current_requester.likes.create(order_id: params[:order_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        like = Like.find_by(order_id: params[:order_id], requester_id: current_requester.id)
        like.destroy
        redirect_back(fallback_location: root_path)
    end
    
end

