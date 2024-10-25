# frozen_string_literal: true

class Components::Posts::NewButton < Components::Base
  def view_template
    div(class: base_class) {
      render RBUI::Tooltip do
        render RBUI::TooltipTrigger do
          link_to new_post_path, class: button_class, data: { controller: "scroll-opacity" } do
            div(class: "w-6 h-6") {
              render Components::InlineSvg.new("plus.svg")
            }
          end
        end
        RBUI::TooltipContent() { "New post" }
      end
    }
  end

  def base_class
    "fixed right-5 top-[calc(100vh-7rem)] md:top-[calc(100vh-4rem)] md:right-24 z-10"
  end

  def button_class
    "
      inline-flex rounded-full bg-primary transform hover:rotate-180 transition duration-500
      p-3 md:p-4 items-center justify-center drop-shadow-lg text-white
    "
  end
end
