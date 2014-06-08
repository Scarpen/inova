class User < ActiveRecord::Base
	devise	:database_authenticatable, :registerable,
	        :trackable, :validatable

	has_and_belongs_to_many :roles

	# Identificar Role
	def role? r
		self.roles.each do |role|
			if role[:name] == r
				return true
			end
		end
		return false
	end

end
