# frozen_string_literal: true

class Components::Posts::Author < Components::Base
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def view_template
    div(class: "flex items-center mb-2 md:mb-0") {
      render Components::Users::Avatar.new(user: user, size: :sm)
      h2(class: "ms-2 text-sm") { user.name }
    }
  end
end
