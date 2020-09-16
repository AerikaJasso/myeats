require 'test_helper'

class CooksEditTest < ActionDispatch::IntegrationTest
  def setup
    @cook = Cook.create!(cook_name: "Johannes", email:"jj@me.com",
                         password:"password", password_confirmation: "password")
  end

  test "reject an invalid edit" do
    get edit_cook_path(@cook)
    assert_template "cooks/edit"
    patch cook_path(@cook), params: { cook: { cook_name: " ", email: "bb@me.com" } }
    assert_template "cooks/edit"
    assert_select "div.form-group"
  end

  test "accept a valid edit" do
    get edit_cook_path(@cook)
    assert_template "cooks/edit"
    patch cook_path(@cook), params: { cook: { cook_name: "june", email: "june@me.com" } }
    assert_redirected_to @cook
    assert_not flash.empty?
    @cook.reload
    assert_match "june", @cook.cook_name
    assert_match "june@me.com", @cook.email
  end
end
