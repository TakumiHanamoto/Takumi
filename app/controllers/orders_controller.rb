class OrdersController < ApplicationController
    
    def index
        if requester_signed_in?
            @requesters = Requester.all
            @students = Student.all
            rooms = current_requester.rooms
            @requester_ids = []
            @student_ids = []
            rooms.each do |r|
                @student_ids << r.student_id
            end
        elsif student_signed_in?
            @students = Student.all
            @requesters = Requester.all
            rooms = current_student.rooms
            @student_ids = []
            @requester_ids = []
            rooms.each do |r|
                @requester_ids << r.requester_id
            end
        end

        @orders = Order.all
        if params[:search] == nil
            @orders= Order.all.page(params[:page]).per(10)
        elsif params[:search] == ''
            @orders= Order.all.page(params[:page]).per(10)
        elsif params[:search] == 'order.id'
            @orders= Order.where(id, params[:search]).page(params[:page]).per(10)
        else
            @orders = Order.where("body LIKE ? ",'%' + params[:search] + '%')
        end
    end

    def new
        @order = Order.new
    end

    def create
        order = Order.new(order_params)
        order.requester_id = current_requester.id
        if order.save!
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
        params.require(:order).permit(:body, :title, :image, :place, :datefrom, :dateto, :people, :job)
    end
end
