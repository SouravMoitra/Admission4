class AddUniqueKeyToSubStrMap < ActiveRecord::Migration
  def change
    add_index :sub_str_maps, ["stream_id", "subject_id"], unique: true, using: :btree
  end
end
