class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username, :null => false
      t.string :email, :null => false
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token
      t.date   :birthdate, :null => false
      t.integer :county_id, :null => false
      t.string :city
      t.integer :gender_id, :null => false
      t.integer :looking_for_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
