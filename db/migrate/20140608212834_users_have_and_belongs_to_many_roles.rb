class UsersHaveAndBelongsToManyRoles < ActiveRecord::Migration
  def change
  	create_table :roles_users, id: false do |t|
  		t.references :role, :user, index: true
  	end
  end
end
