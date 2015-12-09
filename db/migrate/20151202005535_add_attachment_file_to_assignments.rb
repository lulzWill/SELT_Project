class AddAttachmentFileToAssignments < ActiveRecord::Migration
  def self.up
    change_table :assignments do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :assignments, :file
  end
end
