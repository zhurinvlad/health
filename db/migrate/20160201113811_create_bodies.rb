class CreateBodies < ActiveRecord::Migration
  def change
    create_table :bodies do |t|
      t.json :image

      t.timestamps null: false
    end
  end
end
