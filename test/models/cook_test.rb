require 'test_helper'

class CookTest < ActiveSupport::TestCase
  def setup
    @cook = Cook.new(cook_name: "Isabella", email:"isabella@gmail.com")
  end

  test "cook should be valid" do
    assert @cook.valid?
  end

  test "cook name should be present" do
    @cook.cook_name = ""
    assert_not @cook.valid?
  end

  test "cook name should be less than 30 characters" do
    @cook.cook_name = "a" * 31
    assert_not @cook.valid?
  end

  test "email should be present" do
    @cook.email = ""
    assert_not @cook.valid?
  end

  test "email should be less than 255 characters" do
    @cook.email = "a" * 245 + "@example.com"
    assert_not @cook.valid?
  end

  test "email should accept valid format" do
    valid_emails = %w[user@example.com LOLA@gmail.com L.first@outlook.com alfonso+ruiz@co.uk.org]
    valid_emails.each do |valids|
      @cook.email = valids
      assert @cook.valid?, "#{ valids.inspect} should be valid "
    end
  end

  test "should reject invalid email format" do
    invalid_emails = %w[lola@example lola@example,com lola.com lola.name@gmail. lola@bar+foo.com]
    invalid_emails.each do |invalids|
      @cook.email = invalids
      assert_not @cook.valid?, "#{invalids.inspect} should be invalid"
    end
  end

  test "email should be unique and case insensitive" do
    duplicate_cook = @cook.dup
    duplicate_cook.email = @cook.email.upcase
    @cook.save
    assert_not duplicate_cook.valid?
  end

  test "email should be lowercase prior to hitting database" do
    mixed_email = "LOLAG@Example.com"
    @cook.email = mixed_email
    @cook.save
    assert_equal mixed_email.downcase, @cook.reload.email
  end
end