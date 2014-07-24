class Project < ActiveRecord::Base

  validates :title, :description, presence: true
  validates :title, :description, length: { minimum: 4 }

  scope :stage_one, -> { where("stage_id = 1") }
  scope :stage_two, -> { where("stage_id = 2") }
  scope :stage_three, -> { where("stage_id = 3") }
  scope :stage_four, -> { where("stage_id = 4") }
  scope :available, -> { where("situation = 'available'")}
  scope :unavailable, -> { where("situation = 'unavailable'")}


  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events, 
    :reject_if => :all_blank, :allow_destroy => true
  belongs_to :protection
  belongs_to :stage

  paginates_per 10

  # Altera a situação do Projeto quando o 'manager'
  # dá o parecer
  def change_situation
    self.situation = "available"
  end

end
