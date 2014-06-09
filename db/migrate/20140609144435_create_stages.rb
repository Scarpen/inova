class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :current_project_stage

      t.timestamps
    end
  end
end
