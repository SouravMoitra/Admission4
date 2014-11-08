class AddForeginKeyAcademics < ActiveRecord::Migration
  def change
    add_foreign_key(:academics, :users)
  end
end
