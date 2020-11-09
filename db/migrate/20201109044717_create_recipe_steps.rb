class CreateRecipeSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_steps do |t|
      t.references :recipe, foreign_key: true
      t.text :step
      t.string :step_image_id

      t.timestamps
    end
  end
end
