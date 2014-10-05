class CreateAcademics < ActiveRecord::Migration
  def change
    create_table :academics do |t|
      t.integer :user_id,        null: false
      t.integer :tenth_rollno,   null: false
      t.decimal :tenth_marks,    null: false, precision: 10, scale: 2, default: 40.0
      t.integer :tenth_year,     null: false
      t.string  :tenth_board,    null: false
      t.string  :twelfth_stream,  null: false
      t.integer :twelfth_rollno,   null: false
      t.decimal :twelfth_marks,    null: false, precision: 10, scale: 2, default: 40.0
      t.integer :twelfth_year,     null: false
      t.string :twelfth_stream,   null: false
      t.string :twelfth_board, null: false

      t.timestamps
    end
  end
end
