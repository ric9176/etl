class CreateStudentProfiles < ActiveRecord::Migration
  def change
    create_table :student_profiles do |t|
      t.string :name
      t.string :native_language
      t.text :learning_objectives
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
