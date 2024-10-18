# frozen_string_literal: true

class Components::Navigation::WebThemeDropdown < Components::Base
  def view_template
    RBUI::DropdownMenu(options: { placement: "bottom" }, class: "hidden md:flex", data: { controller: "system-theme" }, tabindex: 0) do
      RBUI::DropdownMenuTrigger(class: "w-full") do
        div(class: "flex items-center justify-center theme-icons") {
          div(class: "block dark:hidden") {
            render InlineSvg.new("sun.svg")
          }
          div(class: "hidden dark:block") {
            render InlineSvg.new("moon.svg")
          }
          "Test"
        }
      end
      render RBUI::DropdownMenuContent.new do
        div(data: { action: "click->system-theme#light" }) {
          render RBUI::DropdownMenuItem.new do
            div(class: "flex items-center") {
              span {
                render InlineSvg.new("sun.svg")
              }
              RBUI::TypographySmall(class: "ms-2") { "Light" }
            }
          end
        }
        render RBUI::DropdownMenuSeparator.new
        div(data: { action: "click->system-theme#dark" }) {
          render RBUI::DropdownMenuItem.new do
            div(class: "flex items-center") {
              span {
                render InlineSvg.new("moon.svg")
              }
              RBUI::TypographySmall(class: "ms-2") { "Dark" }
            }
          end
        }
        render RBUI::DropdownMenuSeparator.new
        div(data: { action: "click->system-theme#default" }) {
          render RBUI::DropdownMenuItem.new do
            div(class: "flex items-center") {
              span {
                render InlineSvg.new("computer.svg")
              }
              RBUI::TypographySmall(class: "ms-2") { "System" }
            }
          end
        }
      end
    end
  end
end
