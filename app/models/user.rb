class User < ActiveRecord::Base
	devise	:database_authenticatable, :registerable, :confirmable,
	        :trackable, :validatable

	has_and_belongs_to_many :roles

	# Identificar Role
	def role?(r)
		self.roles.each do |role|
			role[:name] == r
		end
	end

end
