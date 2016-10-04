class OrdersController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@orders = current_user.orders.all
	end

	def show
		@order = current_user.orders.find(params[:id])
	end

	def new
		@listener = Listener.find(params[:listener_id])
		@order = @listener.orders.new
		@order.save
	end

	def create
		@listener = Listener.find(params[:listener_id])
		@order = @listener.orders.new(order_params)

	 #  if params[:order][:listener_timeship_ids] = {}
		# 	  render :action => "new"
		# else
		@order.user = current_user
		@order.price = @listener.price
		@order.quantity =params[:order][:listener_timeship_ids].count - 1
		@order.subtotal = @order.price * @order.quantity
		
		if @order.save
			ListenerTimeship.where(id: params[:order][:listener_timeship_ids]).update_all order_id: @order.id
			flash[:notice] = "新增訂單成功"
			redirect_to user_order_path(current_user,@order)
		else
			#foo
		end

		# end
	end

	def edit
		@order = Order.find(params[:id])
		@listener = @order.listener
	end

	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
		redirect_to user_order_path(current_user,@order)
	end

	def destroy
		@order = Order.find(params[:id])
		@order.listener_timeships.update(order_id: nil)
		@order.destroy
		redirect_to user_orders_path(current_user)
	end

	private

	def order_params
		params.require(:order).permit(:quantity)
	end
end
