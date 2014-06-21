class CreateProtections < ActiveRecord::Migration
  def change
    create_table :protections do |t|
      t.text :description
      t.timestamps
    end
  end
end
