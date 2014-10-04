class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.integer :user_id
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.date :date_of_birth, null: false
      t.string :mothers_name, null: false, default: ""
      t.string :fathers_name, null: false, default: ""
      t.string :gender, null: false
      t.string :category, null: false, default: ""
      t.string :address, null: false
      t.string :mobile_no, null: false

      t.timestamps
    end
  end
end
