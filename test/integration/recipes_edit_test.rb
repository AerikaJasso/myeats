require 'test_helper'

class RecipesEditTest < ActionDispatch::IntegrationTest
  def setup
    @cook = Cook.create!(cook_name: "Johannes", email:"jj@me.com")
    @recipe = Recipe.create!(name:"Tacos", description:"Yummy", cook: @cook)
  end

  test "reject invalid recipe update" do
    get edit_recipe_path(@recipe)
    assert_template "recipes/edit"
    patch recipe_path(@recipe), params: { recipe: { name: "", description: ""} }
    assert_template "recipes/edit"
    assert_select "h4.error-title"
    assert_select "div.error-body"
  end

  test "successfully edit a recipe" do
    get edit_recipe_path(@recipe)
    assert_template "recipes/edit"
    updated_name = "Cajun Shrimp"
    updated_description = "Spicy and sweet."
    patch recipe_path(@recipe), params: { recipe: { name: updated_name, description: updated_description} }
    assert_redirected_to @recipe
    assert_not flash.empty?
    @recipe.reload
    assert_match updated_name, @recipe.name
    assert_match updated_description, @recipe.description
  end
end
