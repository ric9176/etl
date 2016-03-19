class AddUserIdToProfiles < ActiveRecord::Migration
  def change
    add_reference :profiles, :user, index: true, foreign_key: true
  end
end
