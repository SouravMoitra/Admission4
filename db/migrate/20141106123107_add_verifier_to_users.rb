class AddVerifierToUsers < ActiveRecord::Migration
  def change
    add_column :users, :verifier, :boolean, default: false
  end
end
