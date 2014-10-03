class CreateStreamSlectors < ActiveRecord::Migration
  def change
    create_table :stream_selectors do |t|
      t.integer :user_id
      t.integer :stream_id
      t.integer :calculated_marks

      t.timestamps
    end
  end
end
