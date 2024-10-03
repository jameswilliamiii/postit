require "test_helper"

class UserTest < ActiveSupport::TestCase
  describe "Validations" do
    subject { build(:user) }

    should validate_presence_of(:name)
    should validate_presence_of(:email_address)
    should validate_uniqueness_of(:email_address).ignoring_case_sensitivity
  end

  describe "Associations" do
    subject { build(:user) }

    should have_many(:posts).dependent(:destroy)
    should have_many(:sessions).dependent(:destroy)
  end

  describe "Attributes" do
    test "email_address should be normalized" do
      email = "Test@test.com"
      user = create(:user, email_address: email)
      assert_equal email.downcase, user.email_address
    end
  end
end
