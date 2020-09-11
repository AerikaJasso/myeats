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
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end
end
