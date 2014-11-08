class AddSlugToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :slug, :string
    add_index :streams, :slug
  end
end
