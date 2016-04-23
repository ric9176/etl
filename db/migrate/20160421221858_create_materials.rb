class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :date
      t.string :link
      t.references :student, index: true, foreign_key: true
      t.references :teacher, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
