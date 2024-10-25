# frozen_string_literal: true

class Components::Navigation::Bar < Components::Base
  def view_template
    nav(class: nav_classes) {
      div(class: "flex flex-wrap items-center justify-between mx-auto px-4 py-2") {
        link_to(root_path, class: logo_classes) {
          "PostIt"
        }
        button(data: { collapse_toggle: "navbar" }, class: buton_classes, aria: { controls: "navbar-default", expanded: "false" }) {
          span(class: "sr-only") { "Open main menu" }
          render InlineSvg.new("mobile-nav-button.svg")
        }

        div(class: "hidden w-full md:block md:w-auto", id: "navbar") {
          ul(class: "flex flex-col font-medium mt-4 rounded-lg md:space-x-8 md:flex-row md:mt-0 md:border-0 bg-transparent") {
            li { render RBUI::Link.new(href: posts_path, variant: :ghost) { "Posts" } }
            li(class: "flex items-center") { render Components::Navigation::WebThemeDropdown.new }
            li {
              if helpers.authenticated?
                render Navigation::WebAccountDropdown.new
              else
                render RBUI::Link.new(href: new_session_path, variant: :ghost) { "Sign In" }
              end
            }
          }
        }
      }
    }
  end

  def nav_classes
    "
      supports-backdrop-blur:bg-background/80 fixed top-0 z-50 w-full border-b bg-background/80
      backdrop-blur-2xl backdrop-saturate-200 mb-4 hidden md:block
    "
  end

  def buton_classes
    "
      inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-700 dark:text-gray-200 rounded-lg
      md:hidden focus:outline-none focus:ring-2 focus:bg-gray-200 dark:focus:bg-gray-800 focus:ring-gray-200 dark:focus:ring-gray-800
    "
  end

  def logo_classes
    "flex items-center space-x-3 font-bold font-special-elite text-3xl text-black dark:text-white"
  end
end
