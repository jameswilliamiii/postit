# frozen_string_literal: true

class Components::Navigation::WebAccountDropdown < Components::Base
  def view_template
    RBUI::DropdownMenu(options: { placement: "bottom" }, class: "hidden md:block", tabindex: 0) do
      RBUI::DropdownMenuTrigger(class: "w-full") do
        render Components::Users::Avatar.new(user: Current.user, class: "cursor-pointer")
      end
      render RBUI::DropdownMenuContent.new do
        render RBUI::DropdownMenuItem.new(href: profile_path) { "Profile" }
        render RBUI::DropdownMenuSeparator.new
        render RBUI::DropdownMenuItem.new(href: edit_account_password_path) { "Password" }
        render RBUI::DropdownMenuSeparator.new
        render RBUI::DropdownMenuItem.new(href: session_path, data: { turbo_method: :delete }) { "Sign out" }
      end
    end
  end
end
