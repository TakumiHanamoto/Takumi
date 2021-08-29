class ReceivesController < ApplicationController
    def create
        receive = current_student.receives.create(order_id: params[:order_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        receive = Receive.find_by(order_id: params[:order_id], student_id: current_student.id)
        receive.destroy
        redirect_back(fallback_location: root_path)
    end
end
