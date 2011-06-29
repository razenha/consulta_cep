class CreateCeps < ActiveRecord::Migration
  def self.up
    create_table :ceps do |t|
      t.integer :dynamap_id
      t.integer :from_left
      t.integer :to_left
      t.integer :from_right
      t.integer :to_right
      t.string :name
      t.string :fcc
      t.string :postal_8l
      t.string :postal_8r
      t.string :muni_l
      t.string :muni_r

      t.timestamps
    end
    
    add_index :ceps, :name
    add_index :ceps, :fcc
    add_index :ceps, :postal_8l
    add_index :ceps, :postal_8r
    add_index :ceps, :muni_l
    add_index :ceps, :muni_r
    
  end

  def self.down
    drop_table :ceps
  end
end
