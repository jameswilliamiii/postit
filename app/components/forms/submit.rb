# frozen_string_literal: true

class Components::Forms::Submit < Components::Base
  def initialize(**options)
    @options = options
  end

  def view_template(&block)
    render RBUI::Button.new(type: :submit, class: "w-full py-5", **@options) { yield }
  end
end
