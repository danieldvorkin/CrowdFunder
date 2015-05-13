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
end
