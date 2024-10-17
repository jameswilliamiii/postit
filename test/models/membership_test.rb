require "test_helper"

class MembershipTest < ActiveSupport::TestCase
  #-----------------------------------------------------------------------------
  # Associations
  #-----------------------------------------------------------------------------

  should belong_to(:user)
  should belong_to(:organization)

  #-----------------------------------------------------------------------------
  # Enums
  #-----------------------------------------------------------------------------

  should define_enum_for(:role).with_values(member: 0, admin: 1, owner: 2)
end
