class AddColumnsCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :race, :string
    add_column :characters, :class_lvl, :string
    add_column :characters, :alignment, :string
    add_column :characters, :background, :string
    add_column :characters, :personality, :string
    add_column :characters, :photo, :string
  end
end
