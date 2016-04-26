class AddSkypeUsernameToStudentProfiles < ActiveRecord::Migration
  def change
    add_column :student_profiles, :skype_username, :string
  end
end
