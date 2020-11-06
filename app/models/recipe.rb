class Recipe < ApplicationRecord
  
  belongs_to :user
  
  attachment :recipe_image
  
  validates :title, presence: true
  validates :body, presence: true
  validates :material, presence: true
  
end
