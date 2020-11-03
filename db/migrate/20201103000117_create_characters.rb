class CreateCharacters < ActiveRecord::Migration[4.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :race
      t.string :class
      t.string :alignment
      t.string :background
      t.string :personality
      t.text :history
      t.string :photo_url
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
