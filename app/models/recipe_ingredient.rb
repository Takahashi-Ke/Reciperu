class RecipeIngredient < ApplicationRecord
  
  belongs_to :recipe
  
  validates :ingredient, presence: true, length: {maximum: 10}
  validates :quantity, presence: true, length: {maximum: 5}
  
end
