class User < ActiveRecord::Base
  devise  :database_authenticatable, :registerable, :confirmable,
  :trackable, :validatable

  has_many :projects

  validates :full_name, presence: true

end
