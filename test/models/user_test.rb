require "test_helper"

class UserTest < ActiveSupport::TestCase
  describe "Validations" do
    subject { build(:user, email: "test@test.com") }

    should validate_presence_of(:name)
    should validate_presence_of(:email)
    should validate_uniqueness_of(:email)
  end
end
