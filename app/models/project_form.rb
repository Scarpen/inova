class ProjectForm < ActiveRecord::Base
	has_one :security
	has_one :stage
	has_many :events
end
