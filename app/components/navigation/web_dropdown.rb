# frozen_string_literal: true

class Components::Navigation::WebDropdown < Components::Base
  def view_template
    RBUI::DropdownMenu(options: { placement: "bottom" }, class: "hidden md:block") do
      RBUI::DropdownMenuTrigger(class: "w-full") do
        render Components::Users::Avatar.new(user: helpers.current_user, class: "cursor-pointer")
      end
      render RBUI::DropdownMenuContent.new do
        render RBUI::DropdownMenuLabel.new { "My Account" }
        render RBUI::DropdownMenuSeparator.new
        render RBUI::DropdownMenuItem.new(href: session_path, data: { turbo_method: :delete }) { "Sign out" }
      end
    end
  end
end
