class AddForeginKeyPersonals < ActiveRecord::Migration
  def change
    add_foreign_key(:personals, :users)
  end
end
