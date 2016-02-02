class CreateHeads < ActiveRecord::Migration
  def change
    create_table :heads do |t|
      t.string :image

      t.timestamps null: false
    end
  end
end
