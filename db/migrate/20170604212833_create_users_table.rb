class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :phone_number,          null: false
      t.string :email,                 null: false
      t.string :password_digest,       null: false
      t.string :first_name,            null: false
      t.string :last_name,             null: false
      t.string :session_token
      t.string :user_type,             null: false
      t.integer :car_id
      t.timestamps null: false
    end

    add_index :users, :phone_number, unique: true
    add_index :users, :email, unique: true
    add_index :users, [:phone_number, :password_digest], unique: true
    add_index :users, [:email, :password_digest], unique: true
    add_index :users, :session_token, unique: true
  end
end
