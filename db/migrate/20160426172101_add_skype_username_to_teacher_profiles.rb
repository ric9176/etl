class AddSkypeUsernameToTeacherProfiles < ActiveRecord::Migration
  def change
    add_column :teacher_profiles, :skype_username, :string
  end
end
