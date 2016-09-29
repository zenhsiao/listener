class Admin::AvailabletimesController < ApplicationController
	def index
		@availabletimes = Availabletime.all
	end

	def new
		@availabletime = Availabletime.new
	end

	def create
		@availabletime = Availabletime.new(availabletime_params)
		if @availabletime.save
			flash[:notice]="新增成功"
			redirect_to admin_availabletimes_path
		else	
			render :action => :new
		end
	end

	def destroy
		@availabletime = Availabletime.find(params[:id])
		@availabletime.destroy
		redirect_to admin_availabletimes_path
	end

	private
	def availabletime_params
		params.require(:availabletime).permit(:time_start,:time_end)
	end
end
