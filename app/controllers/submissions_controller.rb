class SubmissionsController < ApplicationController
	before_action :authenticate_user!

	def index
		if Submission.all.count > 100
			@submissions = Submission.all[-100..-1]
		elsif Submission.all.count == 0
			@submissions = []
		else
			@submissions = Submission.all
		end
	end

	def submit
		@problem = Problem.find(params[:problem_id])
		if @problem.flag == params[:flag]
			# check record
			if Submission.find_by(:problem => @problem, :user => current_user) == nil
				# save to database
				@submission = Submission.create(:problem => @problem, :user => current_user)
				current_user.point += @problem.point
				current_user.save

				redirect_to @problem, :flash => { :notice => "Congraz! You beat it. :)" }
			else
				redirect_to @problem, :flash => { :alert => "You have already solved this problem. :p" }
			end
		else
			redirect_to @problem, :flash => { :alert => "Your flag is wrong! :(" }
		end
	end
end
