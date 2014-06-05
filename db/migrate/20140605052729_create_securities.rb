class CreateSecurities < ActiveRecord::Migration
  def change
    create_table :securities do |t|
      t.string :type
      t.references :project_form, index: true

      t.timestamps
    end
  end
end
