class User < ActiveRecord::Base

	include Social

	devise  :database_authenticatable, :registerable, :confirmable,
	:trackable, :validatable, :omniauthable
	has_many :permissions
	has_many :projects, through: :permissions
	belongs_to :role

	# validates :full_name, :username, :phone, :rg,
	# :issuing_agency, :issuing_date, :cpf, :birth_date,
	# :nationality, :naturality, :residential_address,
	# :cep, :city, :formation, :course, :institution,
	# :job, presence: true

	before_save :initial_assign

	def role?(r)
		self.role[:name] == r
	end




	# Daqui pra baixo -- Login com Omniauth
	def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
		user = User.where(:provider => auth.provider, :uid => auth.uid).first
		if user
			return user
		else
			registered_user = User.where(:email => auth.info.email).first
			if registered_user
				return registered_user
			else
				user = User.create(full_name:auth.extra.raw_info.name,
					provider:auth.provider,
					uid:auth.uid,
					email:auth.info.email,
					password:Devise.friendly_token[0,20])
				user.skip_confirmation!
				user
			end
		end
	end

	def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
		user = User.where(:provider => auth.provider, :uid => auth.uid).first
		if user
			return user
		else
			registered_user = User.where(:email => auth.uid + "@twitter.com").first
			if registered_user
				return registered_user
			else
				user = User.create(full_name:auth.info.name,
					provider:auth.provider,
					uid:auth.uid,
					email:auth.uid+"@twitter.com",
					password:Devise.friendly_token[0,20])
				user.skip_confirmation!
				user
			end
		end
	end

private

	# Atribui a role de Partaker a todos os usuários que se cadastrarem
	def initial_assign
		self.role = Role.find_by(name: "Partaker")
	end

end
