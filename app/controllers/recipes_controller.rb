class RecipesController < ApplicationController
  
  def new
    @recipe = Recipe.new
    @recipe.recipe_ingredients.build
    @recipe.recipe_steps.build
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end
  
  def index
    @recipes = Recipe.page(params[:page]).reverse_order
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    @user = User.find_by(id: @recipe.user_id)
    @comment = Comment.new
    @comments = Comment.where(recipe_id: @recipe.id)
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
    @recipe.recipe_ingredients.build
    @recipe.recipe_steps.build
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
  
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(
      :title, :body, :recipe_image,
      recipe_ingredients_attributes: [:id, :ingredient, :quantity, :_destroy],
      recipe_steps_attributes: [:id, :step, :step_image, :_destroy]
      )
  end
  
end