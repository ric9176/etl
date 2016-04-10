class CreateTeacherProfiles < ActiveRecord::Migration
  def change
    create_table :teacher_profiles do |t|
      t.string :name
      t.text :bio
      t.references :teacher, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
