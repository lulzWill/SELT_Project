class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :points
      t.integer :order
      t.timestamps
    end
  end
end