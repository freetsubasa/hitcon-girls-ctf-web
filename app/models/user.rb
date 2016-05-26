class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable
	validates_uniqueness_of :username, :case_sensitive => true
	validates_uniqueness_of :student_id, :case_sensitive => true, :message => "ID has been registered"

	has_many :submissions
	has_many :problems, :through => :submissions
end
