class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :name
      t.boolean :sex
      t.integer :head_id
      t.integer :body_id

      t.timestamps null: false
    end
  end
end
