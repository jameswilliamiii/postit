require "test_helper"

class MembershipTest < ActiveSupport::TestCase
  describe "Associations" do
    subject { build(:membership) }

    should belong_to(:user)
    should belong_to(:organization)
  end

  describe "Enums" do
    subject { build(:membership) }

    should define_enum_for(:role).with_values(member: 0, admin: 1, owner: 2)
  end
end
