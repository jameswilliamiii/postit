require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  describe "Associations" do
    subject { build(:organization) }

    should have_many(:memberships).dependent(:destroy)
    should have_many(:users).through(:memberships)
  end

  describe "Validations" do
    subject { build(:organization) }

    should validate_presence_of(:name)
  end
end
