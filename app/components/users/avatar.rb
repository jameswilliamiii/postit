# frozen_string_literal: true

class Components::Users::Avatar < Components::Base
  attr_reader :user, :options

  def initialize(user:, **options)
    @user = user
    options[:class] = [ base_class, options[:class] ].compact.join(" ")
    @options = options
  end

  def view_template
    RBUI::Avatar(size: :md, **options) do
      RBUI::AvatarFallback(**options) { initials }
    end
  end

  def initials
    user.name.split.map(&:first).join.upcase
  end

  def base_class
    "text-white font-bold avatar-initials aspect-square rounded-[9999px] #{user.avatar_color || "bg-primary"}"
  end
end
