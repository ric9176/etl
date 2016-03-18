class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :bio, limit: 200

      t.timestamps null: false
    end
  end
end
