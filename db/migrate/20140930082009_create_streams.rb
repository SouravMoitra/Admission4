class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :name
      t.integer :GEN
      t.integer :SC
      t.integer :ST
      t.integer :OBC_A
      t.integer :OBC_B

      t.timestamps
    end
  end
end
