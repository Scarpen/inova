class CreateSecurities < ActiveRecord::Migration
  def change
    create_table :securities do |t|
      t.string :type_of_security

      t.timestamps
    end
  end
end
