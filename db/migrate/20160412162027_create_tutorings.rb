class CreateTutorings < ActiveRecord::Migration
  def change
    create_table :tutorings do |t|
      t.boolean :request_status
      t.references :student, index: true, foreign_key: true
      t.references :teacher, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
