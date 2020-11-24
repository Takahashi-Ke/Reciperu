class RecipeStep < ApplicationRecord
  
  belongs_to :recipe
  
  attachment :step_image
  
  validates :step, presence: true, length: {maximum: 120}
  
end
