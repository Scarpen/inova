class Profile < ActiveRecord::Base

	has_and_belongs_to_many :users, join_table: "users_projects_profiles"
	has_and_belongs_to_many :projects, join_table: "users_projects_profiles"

end
