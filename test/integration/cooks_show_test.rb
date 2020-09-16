require 'test_helper'

class CooksShowTest < ActionDispatch::IntegrationTest
  def setup
    @cook = Cook.create!(cook_name: "Delia", email:"delia@me.com",
                         password:"password", password_confirmation: "password")
    @recipe = Recipe.create!(name:"Veggie Pad Thai", description:"Great spices", cook: @cook)
  end

  test "should get cooks show" do
    get cook_path(@cook)
    assert_template "cooks/show"
    assert_select "a[href=?]", recipe_path(@recipe), text: @recipe.name
    assert_match @cook.cook_name, response.body
  end
end
