class Project < ActiveRecord::Base

	has_many :rewards
	has_many :pledges
  belongs_to :user
	belongs_to :category
	accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true
	has_attached_file :image, styles: { 
		small: "64x64", 
		med: "250x250", 
		large: "600x600" 
	}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def amount_remaining
		# VERSION 1
		# sum = 0

		# pledges.each do |pledge|
		# 	sum += pledge.contribution
		# end

		# VERSION 2a
		# sum = pledges.inject(0) { |sum, pledge| sum + pledge.contribution }

		# VERSION 2b
		# return funding_goal - pledges.inject(0) { |sum, pledge| sum + pledge.contribution }

		# VERSION 3
		funding_goal - total_raised
	end

	def total_raised
		pledges.sum(:contribution)
	end

	def progress
		(total_raised / funding_goal.to_f) * 100
	end 
end
