class ProjectForm < ActiveRecord::Base
  has_many :stages
  has_many :securities
end
