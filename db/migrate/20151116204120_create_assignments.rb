class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :user_id
      t.string :password_digest
      t.string :role
      t.string :year
      t.timestamps
    end
    add_index :users, :user_id, unique: true
    create_table :courses do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :year_restrictions
      t.string :course_number
      t.string :description
      t.timestamps
    end
    create_table :assignments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true
      t.string :name
      t.integer :points
      t.integer :order
      t.timestamps
    end
  end
end
