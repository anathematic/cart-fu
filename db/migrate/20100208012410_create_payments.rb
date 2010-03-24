class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.text :return_params
      t.boolean :success
      t.integer :order_id
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
