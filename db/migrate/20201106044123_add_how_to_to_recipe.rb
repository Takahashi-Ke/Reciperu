class AddHowToToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :how_to, :text
  end
end
