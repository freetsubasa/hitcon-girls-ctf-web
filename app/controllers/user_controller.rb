class UserController < ApplicationController
	def index
		redirect_to :controller => 'user', :action => 'show', :id => current_user.id
	end
	
	def show
		@submissions = Submission.where(user_id: params[:id])
	end
end
