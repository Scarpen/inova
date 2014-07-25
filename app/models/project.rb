class Project < ActiveRecord::Base
  before_create :status

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
  belongs_to :user

  paginates_per 10


  # Coloca a situação como indisponível
  # antes de salvar o projeto no banco
  def status
    self.situation = "Unavailable"
  end

  # Altera a situação de um projeto
  # A situação pode ser:
  # Availabe (Disponível)
  # Unavailable (Indisponível) 
  def change_situation(situation)
    self.situation = situation
  end

end
