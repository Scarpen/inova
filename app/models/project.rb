class Project < ActiveRecord::Base
  before_create :initial_status

  validates :title, :description, presence: true
  validates :title, :description, length: { minimum: 4 }

  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events, 
    :reject_if => :all_blank, :allow_destroy => true
  belongs_to :protection
  belongs_to :stage
  belongs_to :user

  paginates_per 10

end
