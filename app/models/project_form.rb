class ProjectForm < ActiveRecord::Base
  has_many :stages
  has_many :securities
  accepts_nested_attributes_for :securities
  accepts_nested_attributes_for :stages
end
