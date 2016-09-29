class ListenersController < ApplicationController
	before_action :authenticate_user!, :only=>[:like]
	def index
		@listeners = Listener.all
	end

	def show
		@listener = Listener.find(params[:id])
		@like_num = Likeship.where(:listener => @listener).count
	end

	def like
		@listener = Listener.find(params[:id])
		if current_user.likedListener?(@listener)
			current_user.liked_listeners.destroy(@listener)
			# flash[:notice] = "you dislike it"
		else
			# @listener.likeships.new(:user => current_user)
			# @listener.save
			current_user.liked_listeners << @listener
			# flash[:notice] = "thank for liking it"
	  end
	  @like_num = Likeship.where(:listener => @listener).count
	  respond_to do |format|
	  	format.js
	  end
		# redirect_to listener_path(@listener)
	end
end
