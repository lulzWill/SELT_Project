class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ta, :boolean
    add_column :users, :name, :string
  end
end
