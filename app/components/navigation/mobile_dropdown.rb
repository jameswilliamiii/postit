# frozen_string_literal: true

class Components::Navigation::MobileDropdown < Components::Base
  def view_template
    render RBUI::Accordion.new(class: "block md:hidden") do
      render RBUI::AccordionItem.new(class: "border-b-0") do
        render RBUI::AccordionTrigger.new(class: "py-0 hover:no-underline") do
          render RBUI::TypographySmall.new(class: "px-4 py-2 font-semibold") { "My Account" }
          render RBUI::AccordionIcon.new
        end
        render RBUI::AccordionContent.new do
          render RBUI::Link.new(href: session_path, variant: :ghost, class: "block md:hidden", data: { turbo_method: :delete }) do
            "Sign out"
          end
        end
      end
    end
  end
end
