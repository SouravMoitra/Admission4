class DropVerifierFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :level
  end
end
