class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :race
      t.string :class_lvl
      t.string :alignment
      t.string :personality
      t.string :photo
      t.integer :user_id
      t.timestamps null: false
    end
  end
end