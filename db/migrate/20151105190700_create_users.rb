class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :user_id
      t.string :password_digest
      t.string :role
      t.string :year
      t.timestamps
    end
  end
end
