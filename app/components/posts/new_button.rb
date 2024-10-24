# frozen_string_literal: true

class Components::Posts::NewButton < Components::Base
  include Phlex::Rails::Helpers::LinkTo

  def view_template
    div(class: "sticky flex justify-end top-[calc(100vh-3rem)] md:top-[calc(100vh-7rem)] -me-8 md:-me-10 ms-auto z-10") {
      render RBUI::Tooltip do
        render RBUI::TooltipTrigger do
          link_to new_post_path, class: "ms-auto rounded-full bg-primary hover:bg-primary/75 transform hover:rotate-180 transition duration-500 text-white p-2 flex items-center justify-center drop-shadow-lg" do
            div(class: "w-6 h-6") {
              render Components::InlineSvg.new("plus.svg")
            }
          end
        end
        RBUI::TooltipContent() { "New post" }
      end
    }
  end
end
