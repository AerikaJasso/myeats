require 'test_helper'

class RecipesDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @cook = Cook.create!(cook_name: "Johannes", email:"jj@me.com",
                         password:"password", password_confirmation: "password")
    @recipe = Recipe.create!(name:"Tacos", description:"Yummy", cook: @cook)
  end

  test "successfully delete a recipe" do
    get recipe_path(@recipe)
    assert_template "recipes/show"
    assert_difference "Recipe.count", -1 do
      delete recipe_path(@recipe)
    end
    assert_redirected_to recipes_path
    assert_not flash.empty?
  end
end
