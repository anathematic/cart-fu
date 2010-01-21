class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :suburb
      t.string :state
      t.string :postcode
      t.string :phone
      t.string :country
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
