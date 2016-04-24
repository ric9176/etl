class CreateClassMaterials < ActiveRecord::Migration
  def change
    create_table :class_materials do |t|
      t.date :date
      t.string :link
      t.references :teacher, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
