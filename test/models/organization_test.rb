require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  #-----------------------------------------------------------------------------
  # Associations
  #-----------------------------------------------------------------------------

  should have_many(:memberships).dependent(:destroy)
  should have_many(:users).through(:memberships)

  #-----------------------------------------------------------------------------
  # Validations
  #-----------------------------------------------------------------------------

  should validate_presence_of(:name)
end
