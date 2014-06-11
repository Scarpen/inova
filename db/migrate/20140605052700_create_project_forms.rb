class CreateProjectForms < ActiveRecord::Migration
  def change
    create_table :project_forms do |t|
      t.string :project_title
      t.text :project_concept
      t.references :stage, index: true  
      t.string :author
      t.string :employee
      t.string :leader
      t.references :events, index: true
      t.references :security, index: true
      
      t.timestamps
    end

  end
end
