class RecipesController < ApplicationController
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
    logger.debug @recipe.errors.inspect
  end
  
  def index
    @recipes = Recipe.all
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    @user = User.find_by(id: @recipe.user_id)
  end
  
  def edit
  end
  
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :material, :how_to, :recipe_image)
  end
  
end
