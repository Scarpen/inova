class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.references :stage, index: true
      t.references :protection, index: true
      t.timestamps
    end
  end
end
