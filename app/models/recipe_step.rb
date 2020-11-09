class RecipeStep < ApplicationRecord
  
  belongs_to :recipe
  
  attachment :step_image
  
end
