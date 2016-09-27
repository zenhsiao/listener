class Admin::ListenersController < ApplicationController
	before_action :find_listener, :only => [:edit, :update, :destroy]
	layout "admin"

	def index
		@listeners = Listener.all
	end

	def new
		@listener = Listener.new
	end

	def create
		@listener = Listener.new(listener_params)
		@listener.save
		redirect_to admin_listeners_path
	end

	def edit
	end

	def update
    @listener.update(listener_params)
    redirect_to admin_listeners_path
	end

	def destroy
		@listener.destroy
		redirect_to admin_listeners_path
	end

	private
	def listener_params
		params.require(:listener).permit(:name,:description,:skype_id,:price, :photo, :availabletime_ids=>[])
	end

	def find_listener
		@listener = Listener.find(params[:id])
	end
end
