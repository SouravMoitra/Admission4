class AddVerifedToStreamSelector < ActiveRecord::Migration
  def change
    add_column :stream_selectors, :verified, :boolean, default: false
  end
end
