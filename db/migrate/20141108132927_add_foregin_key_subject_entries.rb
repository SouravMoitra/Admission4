class AddForeginKeySubjectEntries < ActiveRecord::Migration
  def change
    add_foreign_key(:subject_entries, :academics)
  end
end
