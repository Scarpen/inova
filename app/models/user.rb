class User < ActiveRecord::Base
  devise  :database_authenticatable, :registerable, :confirmable,
  :trackable, :validatable

  include Gravtastic
  gravtastic

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

  private

  def initial_assign
  	self.role = Role.find_by(name: "Partaker")
  end

end
