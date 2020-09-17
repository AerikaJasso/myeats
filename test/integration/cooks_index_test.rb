require 'test_helper'

class CooksIndexTest < ActionDispatch::IntegrationTest
  def setup
    @cook = Cook.create!(cook_name: "Delia", email:"delia@me.com",
                         password:"password", password_confirmation: "password")
    @cook2 = Cook.create!(cook_name: "Jose", email:"jose@me.com",
                          password:"password", password_confirmation: "password")
  end

  test "should get cooks listings" do
    get cooks_path
    assert_template "cooks/index"
  end
end
