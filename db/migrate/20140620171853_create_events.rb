class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.date :date
      t.references :project, index: true

      t.timestamps
    end
  end
end
