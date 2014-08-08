class Project < ActiveRecord::Base
  before_create :initial_status

  validates :title, :description, presence: true
  validates :title, :description, length: { minimum: 4 }

  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events, 
    :reject_if => :all_blank, :allow_destroy => true
  
  belongs_to :protection
  belongs_to :stage

  has_and_belongs_to_many :users, join_table: "users_projects_profiles"
  has_and_belongs_to_many :profiles, join_table: "users_projects_profiles"

  paginates_per 10

end
