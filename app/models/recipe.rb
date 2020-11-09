class Recipe < ApplicationRecord
  
  belongs_to :user
  
  has_many :recipe_ingredients, dependent: :destroy
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
  
  has_many :recipe_steps, dependent: :destroy
  accepts_nested_attributes_for :recipe_steps, allow_destroy: true
  
  has_many :comments, dependent: :destroy
  
  attachment :recipe_image
  
  validates :title, presence: true
  validates :body, presence: true
  validates :recipe_image, presence: true
  
end
