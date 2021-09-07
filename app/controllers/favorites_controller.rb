class FavoritesController < ApplicationController
    def create
        favorite = current_student.favorites.create(order_id: params[:order_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        favorite = Favorite.find_by(order_id: params[:order_id], student_id: current_student.id)
        favorite.destroy
        redirect_back(fallback_location: root_path)
    end
end
