class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.boolean :request_status, default: false
      t.references :student, index: true, foreign_key: true
      t.references :teacher, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
