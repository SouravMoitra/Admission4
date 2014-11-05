class Add12thstreamToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :tstream,  :string , null: false, default: "Others"
  end
end
