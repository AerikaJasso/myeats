require 'test_helper'

class CooksSignupTest < ActionDispatch::IntegrationTest
  test "should get signup path" do
    get signup_path
    assert_response :success
  end

  test "reject an invalid signup" do
    get signup_path
    assert_no_difference "Cook.count" do
      post cooks_path, params: { cook: { cook_name: " ", email: " ",
                                         password: "password", password_confirmation: ""} }
    end
    assert_template "cooks/new"
    assert_select "div.form-group"
  end

  test "accept a valid signup" do
    get signup_path
    assert_difference "Cook.count",1 do
      post cooks_path, params: { cook: { cook_name: "David", email: "davidg@me.com ",
                                         password: "password123", password_confirmation: "password123" } }
    end
    follow_redirect!
    assert_template "cooks/show"
    assert_not flash.empty?
  end
end
