class RankController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = []
		if User.where.not(point: 0).count > 0
			max = User.where.not(point: 0).limit(1)[0].point
			us = User.where.not(point: 0).order('point DESC')
			tmp = []
			us.each do |u|
				if u.point == max
					tmp << { u => Submission.where(:user => u).last.created_at}
				else
					tmp.sort! { |a,b| a.values <=> b.values }
					@users = @users + tmp
					tmp = []
					tmp << { u => Submission.where(:user => u).last.created_at}
					max = u.point
				end
			end
			tmp.sort! { |a,b| a.values <=> b.values }
			@users = @users + tmp
		end
	end
end
