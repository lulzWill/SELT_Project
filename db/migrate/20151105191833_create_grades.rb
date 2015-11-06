class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :points
      t.timestamps
    end
  end
end
