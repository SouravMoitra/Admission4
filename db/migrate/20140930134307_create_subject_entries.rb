class CreateSubjectEntries < ActiveRecord::Migration
  def change
    create_table :subject_entries do |t|
      t.integer :academic_id
      t.integer :subject_id
      t.integer :marks

      t.timestamps
    end
  end
end
