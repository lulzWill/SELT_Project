class AddColumnsToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :start_at, :datetime
    add_column :assignments, :end_at, :datetime
    add_column :assignments, :allDay, :string
    add_column :assignments, :title, :string
  end
end
