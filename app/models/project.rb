class Project < ActiveRecord::Base
  before_create :initial_status

  validates :title, :description, presence: true
  validates :title, :description, length: { minimum: 4 }

  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events, 
    :reject_if => :all_blank, :allow_destroy => true
  has_many :users_projects_profiles
  has_many :users, through: :users_projects_profiles
  has_many :profiles, through: :users_projects_profiles
  belongs_to :protection
  belongs_to :stage

  paginates_per 10

end
