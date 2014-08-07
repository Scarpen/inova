class Profile < ActiveRecord::Base

	has_many :users_projects_profiles
  	has_many :projects, through: :users_projects_profiles
  	has_many :users, through: :users_projects_profiles

end
