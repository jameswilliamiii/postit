# frozen_string_literal: true

class Components::Navigation::WebThemeDropdown < Components::Base
  attr_reader :options

  def initialize(options = {})
    @options = options
  end

  def view_template
    RBUI::DropdownMenu(options: { placement: "bottom" }, class: "flex cursor-pointer", data: { controller: "system-theme" }, tabindex: 0) do
      RBUI::DropdownMenuTrigger(**options) do
        div(class: "flex items-center justify-center theme-icons") {
          div(class: "block dark:hidden") {
            render InlineSvg.new("sun-solid.svg")
          }
          div(class: "hidden dark:block") {
            render InlineSvg.new("moon-solid.svg")
          }
          "Test"
        }
      end
      render RBUI::DropdownMenuContent.new do
        div(data: { action: "click->system-theme#light" }) {
          render RBUI::DropdownMenuItem.new do
            div(class: "flex items-center w-2 h-2") {
              RBUI::TypographySmall(class: "ms-2") { "Light" }
            }
          end
        }
        render RBUI::DropdownMenuSeparator.new
        div(data: { action: "click->system-theme#dark" }) {
          render RBUI::DropdownMenuItem.new do
            div(class: "flex items-center") {
              RBUI::TypographySmall(class: "ms-2") { "Dark" }
            }
          end
        }
        render RBUI::DropdownMenuSeparator.new
        div(data: { action: "click->system-theme#default" }) {
          render RBUI::DropdownMenuItem.new do
            div(class: "flex items-center") {
              RBUI::TypographySmall(class: "ms-2") { "System" }
            }
          end
        }
      end
    end
  end
end
