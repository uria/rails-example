class CreateBodyTypes < ActiveRecord::Migration
  def self.up
    create_table :body_types do |t|
      t.string :name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :body_types
  end
end
