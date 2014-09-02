class User < ActiveRecord::Base

	devise  :database_authenticatable, :registerable, :confirmable,
	:trackable, :validatable, :omniauthable
	has_many :permissions
	has_many :projects, through: :permissions
	has_many :profiles, through: :permissions
	belongs_to :role

	before_create :initial_assign

	def role?(r)
		self.role[:name] == r
	end

	def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      unless auth.provider == 'twitter'
        user.email = auth.info.email 
        user.skip_confirmation!
      end
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

  def first_name
    first_name = self.full_name.split.first
  end


	private

	# Atribui a role de Partaker a todos os usuários que se cadastrarem
	def initial_assign
		self.role = Role.find_by(name: "Partaker")
	end

end
