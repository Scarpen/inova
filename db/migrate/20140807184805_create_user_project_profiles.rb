class CreateUserProjectProfiles < ActiveRecord::Migration
  def change
    create_table :users_projects_profiles, id: false do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.references :profile, index: true

      t.timestamps
    end
  end
end
