class User < ActiveRecord::Base
	devise	:database_authenticatable, :registerable, :confirmable,
    :trackable, :validatable

  scope :partakers, -> { joins(:roles).where(roles: {name: "Partaker"}) }
  scope :managers, -> { joins(:roles).where(roles: {name: "Manager"}) }

	has_and_belongs_to_many :roles
  has_many :projects

	def role?(r)
		self.roles.each do |role|
			role[:name] == r
		end
	end

end
