class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :address_line1, null: false
      t.string :address_line2
      t.string :town_vill, null: false
      t.string :district, null: false
      t.string :state, null: false
      t.integer :pin, null: false

      t.timestamps
    end
  end
end
