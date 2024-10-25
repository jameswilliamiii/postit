# frozen_string_literal: true

class Components::Breadcrumbs < Components::Base
  attr_reader :breadcrumbs

  def initialize(breadcrumbs:)
    @breadcrumbs = breadcrumbs
  end

  def view_template
    nav(class: "hidden md:flex mb-8", aria: { label: "Breadcrumb" }) {
      ol(class: "inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse") {
        breadcrumbs.each_with_index do |breadcrumb, idx|
          li(class: "inline-flex items-center") {
            link_to(breadcrumb[:title], breadcrumb[:path], class: "inline-flex items-center text-sm hover:text-primary")
          }
          if breadcrumbs.length - 1 != idx
            li(class: "inline-flex items-center") {
              div(class: "flex items-center w-4") {
                render Components::InlineSvg.new("chevron-right.svg")
              }
            }
          end
        end
      }
    }
  end
end
