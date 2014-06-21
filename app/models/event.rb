class Event < ActiveRecord::Base

  validates :description, presence: true

  scope :by_date, -> { order(date: :asc) }
  
  belongs_to :project
  
end
