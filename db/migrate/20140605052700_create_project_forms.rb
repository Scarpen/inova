class CreateProjectForms < ActiveRecord::Migration
  def change
    create_table :project_forms do |t|
      t.string :project_title
      t.text :project_concept
      t.string :current_stage
      t.string :author
      t.string :employee
      t.string :leader
      t.boolean :event
      t.string :event_name
      t.date :event_date
      t.string :security_type
      
      t.timestamps
    end
  end
end
