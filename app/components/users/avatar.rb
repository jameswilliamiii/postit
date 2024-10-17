# frozen_string_literal: true

class Components::Users::Avatar < Components::Base
  attr_reader :user, :options

  def initialize(user:, **options)
    @user = user
    @options = options
  end

  def view_template
    RBUI::Avatar(size: :md, **options) do
      render RBUI::AvatarFallback.new { initials }
    end
  end

  def initials
    user.name.split.map(&:first).join.upcase
  end
end
