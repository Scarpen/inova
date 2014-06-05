class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :current
      t.references :project_form, index: true

      t.timestamps
    end
  end
end
