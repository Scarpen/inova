class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions, id: false do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.references :profile, index: true
    end
  end
end
