class AddAttachmentImageToTeacherProfiles < ActiveRecord::Migration
  def self.up
    change_table :teacher_profiles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :teacher_profiles, :image
  end
end
