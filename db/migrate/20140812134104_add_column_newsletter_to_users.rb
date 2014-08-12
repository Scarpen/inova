class AddColumnNewsletterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :newsletter, :string
  end
end
