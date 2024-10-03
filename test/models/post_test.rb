require "test_helper"

class PostTest < ActiveSupport::TestCase
  describe "Associations" do
    subject { build(:post) }

    should belong_to(:user)
  end

  describe "Validations" do
    subject { build(:post, title: "test") }

    should validate_presence_of(:title)
    should have_rich_text(:message)
  end
end
