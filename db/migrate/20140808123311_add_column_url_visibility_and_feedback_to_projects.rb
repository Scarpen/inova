class AddColumnUrlVisibilityAndFeedbackToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :url, :string
    add_column :projects, :visibility, :string
    add_column :projects, :feedback, :text
  end
end
