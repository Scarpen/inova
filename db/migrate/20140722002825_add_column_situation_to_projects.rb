class AddColumnSituationToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :situation, :string
  end
end
