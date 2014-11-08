class AddForeginKeySubStrMaps < ActiveRecord::Migration
  def change
    add_foreign_key(:sub_str_maps, :subjects)
    add_foreign_key(:sub_str_maps, :streams)
  end
end
