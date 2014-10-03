class AddIndexToSubjectEntry < ActiveRecord::Migration
  def change
    add_index :subject_entries, ["academic_id", "subject_id"], unique: true, using: :btree
  end
end
