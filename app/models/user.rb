class User < ActiveRecord::Base

	include Social

	devise  :database_authenticatable, :registerable, :confirmable,
	:trackable, :validatable, :omniauthable
	has_many :permissions
	has_many :projects, through: :permissions
	belongs_to :role

	validates :full_name, :username, :phone, :rg,
	:issuing_agency, :issuing_date, :cpf, :birth_date,
	:nationality, :naturality, :residential_address,
	:cep, :city, :formation, :course, :institution,
	:job, presence: true

	before_save :initial_assign

	def role?(r)
		self.role[:name] == r
	end

	
	def self.from_omniauth(auth)
		where(auth.slice(:provider, :uid)).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.email = auth.info.email 
     			user.full_name = auth.info.first_name
		end
	end

	def self.new_with_session(params, session)
		if session["devise.user_attributes"]    
			new(session["devise.user_attributes"], without_protection: true) do |user|
				user.attributes = params
				user.valid?
			end
		else
			super
		end
	end

	def password_required?
		super && provider.blank?
	end

	def update_with_password(params, *options)
		if encrypted_password.blank?
			update_attributes(params, *options)
		else
			super
		end
	end


	private

	# Atribui a role de Partaker a todos os usuários que se cadastrarem
	def initial_assign
		self.role = Role.find_by(name: "Partaker")
	end

end
