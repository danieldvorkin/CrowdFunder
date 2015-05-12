class User < ActiveRecord::Base
	has_secure_password
	validates :name, presence: true
	has_many :projects
	has_many :rewards, through: :projects
	has_many :pledges, through: :projects
end
