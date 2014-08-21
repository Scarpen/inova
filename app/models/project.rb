class Project < ActiveRecord::Base
  validates :url, format: { with: URI.regexp }
  validates :title, :description, presence: true
  validates :title, :description, length: { minimum: 4 }
  validates :title, :url , uniqueness: { case_sensitive: false }
  has_many :permissions
  has_many :users, through: :permissions
  has_many :profiles, through: :permissions
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events, 
    :reject_if => :all_blank, :allow_destroy => true
  
  belongs_to :protection
  belongs_to :stage


  paginates_per 10


end
