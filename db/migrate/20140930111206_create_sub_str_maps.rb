class CreateSubStrMaps < ActiveRecord::Migration
  def change
    create_table :sub_str_maps do |t|
      t.integer :stream_id
      t.integer :subject_id
      t.integer :GEN
      t.integer :SC
      t.integer :ST
      t.integer :OBC_A
      t.integer :OBC_B

      t.timestamps
    end
  end
end
