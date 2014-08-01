class User < ActiveRecord::Base
	devise	:database_authenticatable, :registerable, :confirmable,
	:trackable, :validatable

	scope :partakers, -> { joins(:roles).where(roles: {name: "Partaker"}) }
	scope :managers, -> { joins(:roles).where(roles: {name: "Manager"}) }

	has_and_belongs_to_many :roles
	has_many :projects

	after_create :assign_default_role

	validates :full_name, presence: true

	def role?(r)
		self.roles.each do |rl|
			if rl[:name] == r
				return true
			end
		end
		return false
	end

	private
	
	def assign_default_role
		self.roles << Role.where(name: "Partaker")
	end


end
