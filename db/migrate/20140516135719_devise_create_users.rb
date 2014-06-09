class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      #Autor      
      t.string :full_name, limit: 80
      t.string :username
      t.string :phone
      t.string :rg, limit: 20
      t.string :issuing_agency
      t.date :issuing_date
      t.string :cpf, limit: 20
      t.date :birth_date
      t.string :nationality, limit: 20
      t.string :naturality, limit: 20
      t.string :residential_address, limit: 50
      t.string :cep, limit: 8
      t.string :city, limit: 20
      t.string :formation, limit: 20
      t.string :course, limit: 20
      t.string :institution, limit: 20
      t.string :job, limit: 20

      # ## Recoverable
      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at

      # ## Rememberable
      # t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps
    end

    add_index :users, :email,                unique: true
    # add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
