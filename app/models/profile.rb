class Profile < ActiveRecord::Base

	scope :manager, -> { find_by(name: "Manager").id } 

	has_many :users, through: :permissions
	has_many :projects, through: :permissions
	has_many :permissions
end
