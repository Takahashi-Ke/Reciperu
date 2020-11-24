class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @myRecipes = Recipe.where(user_id: @user.id)
    @recipes=@myRecipes.page(params[:page]).reverse_order
    @comments = Comment.where(user_id: @user.id)
    @recipe = Recipe.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :user_image, :introduction)
  end
  
end
