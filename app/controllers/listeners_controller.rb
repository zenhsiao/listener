class ListenersController < ApplicationController
	def index
		@listeners = Listener.all
	end

	def show
		@listener = Listener.find(params[:id])
	end
end
