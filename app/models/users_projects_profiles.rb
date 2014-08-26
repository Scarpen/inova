class UsersProjectsProfiles < ActiveRecord::Base
	self.primary_key = [:user_id, :project_id, :profile_id]
	belongs_to :user
	belongs_to :project
	belongs_to :profile
end