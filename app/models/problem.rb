class Problem < ActiveRecord::Base
	has_many :submissions
	has_many :users, :through => :submissions
end
