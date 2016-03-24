class CreateTeachersUsers < ActiveRecord::Migration
  def change
    create_table :teachers_users, id: false do |t|
      t.references :user, index: true, foreign_key: true
      t.references :teacher, index: true, foreign_key: true
    end
  end
end
