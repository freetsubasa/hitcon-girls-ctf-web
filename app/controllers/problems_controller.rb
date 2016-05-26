class ProblemsController < ApplicationController
	before_action :authenticate_user!
	before_action :admin_user, :only => [:new, :edit, :create, :update, :destroy]

	def index
		@problems = Problem.all
		@categories = Category.all
		@rule =
            "- Don't share flags.\n"+
            "- Don't DOS the server or services.\n"+
            "- Don't attack infrastructures.\n"+
            "- If you find bugs, plz contact TAs.\n"
	end

	def new
		@problem = Problem.new
	end

	def edit
		@problem = Problem.find(params[:id])
	end

	def show
		@problem = Problem.find(params[:id])
		@submissions = Submission.where(problem_id: params[:id])
	end

	def create
		@problem = Problem.new(problem_params)
		@problem.save
		redirect_to @problem
	end

	def update
		@problem = Problem.find(params[:id])

		if @problem.update(problem_params)
			redirect_to @problem
		else
			render 'edit'
		end
	end

	def destroy
		@problem = Problem.find(params[:id])
		@problem.destroy
 		redirect_to problems_path
	end

	private

	def problem_params
		params.require(:problem).permit(:title, :description, :hint, :point, :flag, :category_id)
	end
end
