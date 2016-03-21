class AddTeacherIdToProfiles < ActiveRecord::Migration
  def change
    add_reference :profiles, :teacher, index: true, foreign_key: true
  end
end
