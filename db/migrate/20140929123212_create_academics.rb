class CreateAcademics < ActiveRecord::Migration
  def change
    create_table :academics do |t|
      t.integer :user_id,        null: false
      t.integer :tenth_rollno,   null: false
      t.integer :tenth_marks,    null: false
      t.integer :tenth_year,     null: false
      t.string  :tenth_board,    null: false
      t.string  :twelfth_stream,  null: false
      t.integer :twelfth_rollno,   null: false
      t.integer :twelfth_marks,    null: false
      t.integer :twelfth_year,     null: false
      t.integer :twelfth_stream,   null: false
      t.integer :twelfth_board, null: false

      t.timestamps
    end
  end
end
