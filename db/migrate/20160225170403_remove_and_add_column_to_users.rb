class RemoveAndAddColumnToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :unit, :string
  	add_column :users, :apt, :string
  end
end
