class AddForeginKeyAddresses < ActiveRecord::Migration
  def change
    add_foreign_key(:addresses, :personals)
  end
end
