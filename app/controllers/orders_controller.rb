class OrdersController < ApplicationController
    
    before_action :authenticate_requester!

    def index
        @orders = Order.all
    end

    def new
        @order = Order.new
    end

    def create
        order = Order.new(order_params)
        order.requester_id = current_requester.id
        if order.save
        redirect_to :action => "index"
        else
        redirect_to :action => "new"
        end
    end

    def show
        @order = Order.find(params[:id])
    end

    def edit
        @order = Order.find(params[:id])
    end

    def update
        order = Order.find(params[:id])
        if order.update(order_params)
        redirect_to :action => "show", :id => order.id
        else
        redirect_to :action => "new"
        end
    end

    def destroy
        order = Order.find(params[:id])
        order.destroy
        redirect_to action: :index
    end
    
    private
    def order_params
        params.require(:order).permit(:body, :title)
    end
end
