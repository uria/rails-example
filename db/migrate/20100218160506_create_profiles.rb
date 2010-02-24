class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :marital_status_id
      t.integer :height
      t.integer :body_type_id
      t.boolean :smoker
      t.text :about_me
      t.text :what_i_look_for

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
