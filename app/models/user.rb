class User < ActiveRecord::Base
  devise  :database_authenticatable, :registerable, :confirmable,
  :trackable, :validatable, :omniauthable

  belongs_to :role
  has_and_belongs_to_many :projects, join_table: "users_projects_profiles"
  has_and_belongs_to_many :profiles, join_table: "users_projects_profiles"

  # validates :full_name, :username, :phone, :rg,
  # :issuing_agency, :issuing_date, :cpf, :birth_date,
  # :nationality, :naturality, :residential_address,
  # :cep, :city, :formation, :course, :institution,
  # :job, presence: true

  before_save :initial_assign

  def role?(r)
  	self.role[:name] == r
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
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

  def initial_assign
  	self.role = Role.find_by(name: "Partaker")
  end

end
