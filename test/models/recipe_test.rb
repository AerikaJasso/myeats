require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @cook = Cook.create!(cook_name:"Whizkid", email:"whiz@gmail.com")
    @recipe = @cook.recipes.new(name: "Pad Thai", description: "Killer Pad Thai Recipe", cook: @cook)
  end

  test "recipe without a cook should be invalid" do
    @recipe.cook_id = nil
    assert_not @recipe.valid?
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end

  test "description shouldn't be less than 5 characters" do
    @recipe.description = "a" * 3
    assert_not @recipe.valid?
  end

  test "description shouldn't be more than 500 characters" do
    @recipe.description = "a" * 1001
    assert_not @recipe.valid?
  end
end