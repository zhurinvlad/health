class CreateHeads < ActiveRecord::Migration
  def change
    create_table :heads do |t|
      t.json :image

      t.timestamps null: false
    end
  end
end
