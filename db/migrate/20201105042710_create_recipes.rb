class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :body
      t.string :material
      t.string :recipe_image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
