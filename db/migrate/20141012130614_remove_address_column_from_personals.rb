class RemoveAddressColumnFromPersonals < ActiveRecord::Migration
  def change
		remove_column :personals, :address
  end
end
