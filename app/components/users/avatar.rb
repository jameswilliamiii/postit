# frozen_string_literal: true

class Components::Users::Avatar < Components::Base
  attr_reader :user, :options

  def initialize(user:, **options)
    @user = user
    options[:class] = [ options[:class], base_class ].compact.join(" ")
    @options = options
  end

  def view_template
    RBUI::Avatar(size: :md, **options) do
      RBUI::AvatarFallback(class: "bg-gray-950 dark:bg-white") { initials }
    end
  end

  def initials
    user.name.split.map(&:first).join.upcase
  end

  def base_class
    "text-white dark:text-gray-950 font-bold avatar-initials"
  end
end
