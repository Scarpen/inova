class Permission < ActiveRecord::Base
	  belongs_to :user
      belongs_to :project
      belongs_to :profile

      def addgroup(project, user, profile)
      	    self.project_id = project.id
    		self.user_id = user.id
    		self.profile_id = profile
    		save 
  	  end
end
