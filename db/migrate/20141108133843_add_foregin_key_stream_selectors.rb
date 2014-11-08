class AddForeginKeyStreamSelectors < ActiveRecord::Migration
  def change
    add_foreign_key(:stream_selectors, :users)
    add_foreign_key(:stream_selectors, :streams)
  end
end
