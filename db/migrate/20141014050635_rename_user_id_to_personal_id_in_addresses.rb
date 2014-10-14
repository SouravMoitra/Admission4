class RenameUserIdToPersonalIdInAddresses < ActiveRecord::Migration
  def change
		rename_column :addresses, :user_id, :personal_id
  end
end
