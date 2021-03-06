class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show, :edit, :update]
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 4)
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.cook = Cook.first
    if @recipe.save
      flash[:success] = "Recipe was successfully created!"
      redirect_to recipe_path(@recipe)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe was successfully updated!"
      redirect_to recipe_path(@recipe)
    else
      render "edit"
    end
  end

  def destroy
    Recipe.find(params[:id]).destroy
    flash[:success] = "Recipe successfully deleted!"
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end