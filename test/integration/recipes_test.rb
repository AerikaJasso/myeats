require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  def setup
    @cook = Cook.create!(cook_name: "Delia", email:"delia@me.com")
    @recipe = Recipe.create!(name:"Veggie Pad Thai", description:"Great spices", cook: @cook)
    @recipe2 = Recipe.create!(name:"Tacos", description:"Yummy", cook: @cook)
  end

  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end

  test "should get recipes listings" do
    get recipes_path
    assert_template "recipes/index"
    assert_select "a[href=?]", recipe_path(@recipe), text: @recipe.name
  end

  test "should get recipes show" do
    get recipe_path(@recipe)
    assert_template "recipes/show"
    assert_match @recipe.name.capitalize, response.body
    assert_match @recipe.description, response.body
  end

  test "create new valid recipe" do
    get new_recipe_path
    assert_template "recipes/new"
    recipe_name = "Fish and chips"
    recipe_description = "Cripsy Halibut beer battered in dill."
    assert_difference "Recipe.count", 1 do
      post recipes_path, params: { recipe: { name: recipe_name, description: recipe_description }}
    end
    follow_redirect!
    assert_match recipe_name.capitalize, response.body
    assert_match recipe_description, response.body
  end

  test "reject invalid recipe submission" do
    get new_recipe_path
    assert_template "recipes/new"
    assert_no_difference "Recipe.count" do
      post recipes_path, params: { recipe: { name: " ", description: " "}}
    end
    assert_template "recipes/new"
    assert_select "h4.error-title"
    assert_select "div.error-body"
  end
end
