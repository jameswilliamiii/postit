# frozen_string_literal: true

class Components::Navigation::MobileBar < Components::Base
  def view_template
    nav(class: base_class) {
      link_to posts_path, class: link_class do
        render Components::InlineSvg.new("home-solid.svg")
      end

      link_to profile_path, class: link_class do
        render Components::InlineSvg.new("user-circle-solid.svg")
      end

      render Components::Navigation::WebThemeDropdown.new(class: link_class)

      link_to edit_account_password_path, class: link_class do
        render Components::InlineSvg.new("cog-solid.svg")
      end
    }
  end

  def link_class
    "w-10 h-10 p-1"
  end

  def base_class
    "mobile #{Current.user.nil? ? 'hidden' : nil} md:hidden fixed flex w-full px-4 py-2 items-center justify-between bg-primary bottom-0 text-white dark:text-black z-100"
  end
end
