class CreateStudentsTeachers < ActiveRecord::Migration
  def change
    create_table :students_teachers do |t|
      t.boolean :request_status
      t.references :teacher, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
    end
  end
end
