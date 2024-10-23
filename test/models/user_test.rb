require "test_helper"

class UserTest < ActiveSupport::TestCase
  describe "Validations" do
    subject { build(:user) }

    should validate_presence_of(:name)
    should validate_presence_of(:email_address)
    should validate_uniqueness_of(:email_address).ignoring_case_sensitivity

    describe "password" do
      it "should be at least 8 characters" do
        user = build(:user, password: "1234567")
        assert_not user.valid?
        assert_includes user.errors[:password], "is too short (minimum is 8 characters)"
      end
    end
  end

  describe "Associations" do
    subject { build(:user) }

    should have_many(:posts).dependent(:destroy)
    should have_many(:sessions).dependent(:destroy)
    should have_many(:memberships).dependent(:destroy)
    should have_many(:organizations).through(:memberships)
  end

  describe "Attributes" do
    test "email_address should be normalized" do
      email = "Test@test.com"
      user = create(:user, email_address: email)
      assert_equal email.downcase, user.email_address
    end
  end

  describe "Callbacks" do
    describe "before_create :assign_random_avatar_color" do
      it "should assign a random avatar color before creating a user" do
        user = create(:user)
        assert_includes Components::Account::Profile::Form::AVATAR_COLORS, user.avatar_color
      end
    end
  end

  describe "Instance Methods" do
    describe "#base_organization" do
      it "should return the user's base organization" do
        membership = create(:membership, :owner)
        user = membership.user
        assert_equal membership.organization, user.base_organization
      end

      it "should create a base organization if one does not exist" do
        user = create(:user)
        assert_difference("Organization.count", 1) do
          assert_difference("Membership.count", 1) do
            user.base_organization
          end
        end
      end
    end
  end
end
